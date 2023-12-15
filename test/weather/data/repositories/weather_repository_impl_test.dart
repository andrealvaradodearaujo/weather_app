import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/utils/internet_connection_checker.dart';
import 'package:weather_app/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/data/mappers/weather_data_mappers.dart';
import 'package:weather_app/features/weather/data/models/clouds_info_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/main_info_model.dart';
import 'package:weather_app/features/weather/data/models/next_day_weather_model.dart';
import 'package:weather_app/features/weather/data/models/rain_for_current_info_model.dart';
import 'package:weather_app/features/weather/data/models/snow_for_current_info_model.dart';
import 'package:weather_app/features/weather/data/models/sys_info_model.dart';
import 'package:weather_app/features/weather/data/models/weather_info_model.dart';
import 'package:weather_app/features/weather/data/models/wind_info_model.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/weather/domain/entities/next_days_forecast.dart';

class MockWeatherRemoteDataSource extends Mock implements WeatherRemoteDataSource {}

class MockWeatherLocalDataSource extends Mock implements WeatherLocalDataSource {}

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized

  late WeatherRepositoryImpl repository;
  late MockWeatherRemoteDataSource mockRemoteDataSource;
  late MockWeatherLocalDataSource mockLocalDataSource;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockRemoteDataSource = MockWeatherRemoteDataSource();
    mockLocalDataSource = MockWeatherLocalDataSource();
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    repository = WeatherRepositoryImpl(mockRemoteDataSource, mockLocalDataSource, mockInternetConnectionChecker);
  });

  group('getCurrentWeather', () {
    const lat = 40.7128;
    const lon = -74.0060;

    const currentWeatherModel = CurrentWeatherModel(
      MainInfoModel(
        25.0,  // temp
        28.0,  // feelsLike
        22.0,  // tempMin
        30.0,  // tempMax
        1015,  // pressure
        1015,  // seaLevel
        1015,  // grndLevel
        60,    // humidity
      ),
      [
        WeatherInfoModel(
          'Clear',       // main
          'Clear sky',   // description
          '01d',         // icon
        ),
      ],
      WindInfoModel(
        5.0,   // speed
        180,   // deg
        8.0,   // gust
      ),
      CloudsInfoModel(
        10,   // all
      ),
      10000.0,  // visibility
      RainForCurrentInfoModel(
        0.5,   // oneHour
        1.0,   // threeHours
      ),
      SnowForCurrentInfoModel(
        0.1,   // oneHour
        0.3,   // threeHours
      ),
      SysInfoModel(
        'US',            // country
        1638800000,      // sunrise
        1638840000,      // sunset
      ),
      1638826800,        // dt
      'Test City',       // name
    );

    test('should return current weather from remote data source when internet is available', () async {
      // Arrange
      when(() => mockInternetConnectionChecker.isInternetAvailable()).thenAnswer((_) async => true);
      const remoteModel = currentWeatherModel;
      when(() => mockRemoteDataSource.getCurrentWeather(lat, lon)).thenAnswer((_) async => remoteModel);
      when(() => mockLocalDataSource.getCurrentWeather(lat, lon, any())).thenThrow(CacheDataNotFoundException());
      when(() => mockLocalDataSource.cacheCurrentWeatherModel(lat, lon, any(), remoteModel)).thenThrow(CacheCurrentWeatherException());

      // Act
      final result = await repository.getCurrentWeather(lat, lon);

      // Assert
      expect(result, equals(Right(remoteModel.toCurrentWeather())));
      verify(() => mockRemoteDataSource.getCurrentWeather(lat, lon)).called(1);
      verify(() => mockLocalDataSource.cacheCurrentWeatherModel(lat, lon, any(), remoteModel)).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test('should return current weather from local data source when internet is not available', () async {
      // Arrange
      when(() => mockInternetConnectionChecker.isInternetAvailable()).thenAnswer((_) async => false);
      const localModel = currentWeatherModel;
      when(() => mockLocalDataSource.getCurrentWeather(lat, lon, any())).thenAnswer((_) async => localModel);
      when(() => mockLocalDataSource.cacheCurrentWeatherModel(lat, lon, any(), localModel)).thenAnswer((_) async => Future<void>.value());

      // Act
      final result = await repository.getCurrentWeather(lat, lon);

      // Assert
      expect(result, equals(Right(localModel.toCurrentWeather())));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return a ServerFailure when an exception is thrown by remote data source', () async {
      // Arrange
      when(() => mockInternetConnectionChecker.isInternetAvailable()).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getCurrentWeather(lat, lon)).thenThrow(ServerException());

      // Act
      final result = await repository.getCurrentWeather(lat, lon);

      // Assert
      expect(result, equals(Left(ServerFailure(message: "Server error while getting current weather"))));
      verify(() => mockRemoteDataSource.getCurrentWeather(lat, lon)).called(1);
      verifyZeroInteractions(mockLocalDataSource);
    });
  });

  group('getNextDaysForecast', () {
    const lat = 40.7128;
    const lon = -74.0060;

    var ndwDt = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    final nextDayWeatherModelList = [
      NextDayWeatherModel(
        const MainInfoModel(
          22.0, // temp
          25.0, // feelsLike
          20.0, // tempMin
          24.0, // tempMax
          1010, // pressure
          1015, // seaLevel
          1015, // grndLevel
          70, // humidity
        ),
        [
          const WeatherInfoModel(
            'Clouds', // main
            'Few clouds', // description
            '02d', // icon
          ),
        ],
        const WindInfoModel(
          8.0, // speed
          200, // deg
          10.0, // gust
        ),
        const CloudsInfoModel(
          30, // all
        ),
        8000.0, // visibility
        null,
        null,
        22,
        ndwDt,
      ),
    ];

    final map = SplayTreeMap<DateTime, List<NextDayWeather>>();
    final ndwDateTime = DateTime.fromMillisecondsSinceEpoch(ndwDt * 1000);
    var key = DateTime(ndwDateTime.year, ndwDateTime.month, ndwDateTime.day);
    final nextDayWeatherList = [
      NextDayWeather(
        temp: 22.0,
        feelsLike: 25.0,
        tempMin: 20.0,
        tempMax: 24.0,
        pressure: 1010,
        seaLevel: 1015,
        grndLevel: 1015,
        pop: 22,
        humidity: 70,
        mainGroupWeather: 'Clouds',
        description: 'Few clouds',
        iconUrl: 'https://openweathermap.org/img/wn/02d@2x.png',
        windSpeed: 8.0,
        windDeg: 200,
        windGust: 10.0,
        cloudsAll: 30,
        visibility: 8000.0,
        rainThreeHours: null,
        snowThreeHours: null,
        dt: ndwDateTime,
      ),
    ];
    map[key] = nextDayWeatherList;

    test('should return next days forecast from remote data source when internet is available', () async {
      // Arrange
      when(() => mockInternetConnectionChecker.isInternetAvailable()).thenAnswer((_) async => true);
      final remoteModelList = nextDayWeatherModelList;
      when(() => mockRemoteDataSource.getNextDaysForecast(lat, lon)).thenAnswer((_) async => remoteModelList);
      when(() => mockLocalDataSource.getNextDayWeatherModelList(lat, lon, any())).thenThrow(CacheStorageException());
      when(() => mockLocalDataSource.cacheNextDayWeatherModelList(lat, lon, any(), remoteModelList))
          .thenThrow(CacheCurrentWeatherException());

      // Act
      final result = await repository.getNextDaysForecast(lat, lon);

      // Assert
      expect(result, equals(Right(NextDaysForecast(map: map))));
      verify(() => mockRemoteDataSource.getNextDaysForecast(lat, lon)).called(1);
    });


    test('should return a ServerFailure when an exception is thrown by remote data source', () async {
      // Arrange
      when(() => mockInternetConnectionChecker.isInternetAvailable()).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getNextDaysForecast(lat, lon)).thenThrow(ServerException());

      // Act
      final result = await repository.getNextDaysForecast(lat, lon);

      // Assert
      expect(result, equals(Left(ServerFailure(message: "Server error while getting next days forecast"))));
      verify(() => mockRemoteDataSource.getNextDaysForecast(lat, lon)).called(1);
      verifyZeroInteractions(mockLocalDataSource);
    });
  });
}
