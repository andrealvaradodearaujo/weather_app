import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/resources/dart_extensions/date_extensions.dart';
import 'package:weather_app/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weather_app/features/weather/data/models/clouds_info_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/main_info_model.dart';
import 'package:weather_app/features/weather/data/models/next_day_weather_model.dart';
import 'package:weather_app/features/weather/data/models/rain_for_current_info_model.dart';
import 'package:weather_app/features/weather/data/models/snow_for_current_info_model.dart';
import 'package:weather_app/features/weather/data/models/sys_info_model.dart';
import 'package:weather_app/features/weather/data/models/weather_info_model.dart';
import 'package:weather_app/features/weather/data/models/wind_info_model.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('WeatherLocalDataSource', () {
    late WeatherLocalDataSource dataSource;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      dataSource = WeatherLocalDataSource(mockSharedPreferences);
    });

    const tLat = 37.7749;
    const tLon = -122.4194;
    final tDateTime = DateTime.now();

    const tCurrentWeatherModel = CurrentWeatherModel(
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

    final tNextDayWeatherModelList = [
      NextDayWeatherModel(
        const MainInfoModel(
          22.0,  // temp
          25.0,  // feelsLike
          20.0,  // tempMin
          24.0,  // tempMax
          1010,  // pressure
          1015,  // seaLevel
          1015,  // grndLevel
          70,    // humidity
        ),
        [
          const WeatherInfoModel(
            'Clouds',      // main
            'Few clouds',  // description
            '02d',         // icon
          ),
        ],
        const WindInfoModel(
          8.0,   // speed
          200,   // deg
          10.0,  // gust
        ),
        const CloudsInfoModel(
          30,   // all
        ),
        8000.0,  // visibility
        null,
        null,
        1638913200,  // dt
        22,
      ),
      // ... additional NextDayWeatherModel items with test data
    ];

    test('cacheCurrentWeatherModel should call SharedPreferences to cache data', () async {
      // Arrange
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) => Future.value(true));

      // Act
      await dataSource.cacheCurrentWeatherModel(tLat, tLon, tDateTime, tCurrentWeatherModel);

      // Assert
      verify(() => mockSharedPreferences.setString(any(), any())).called(1);
    });

    test('getCurrentWeather should return a CurrentWeatherModel from SharedPreferences', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(any()))
          .thenReturn(jsonEncode(tCurrentWeatherModel.toJson()));

      // Act
      final result = await dataSource.getCurrentWeather(tLat, tLon, tDateTime);

      // Assert
      expect(result, equals(tCurrentWeatherModel));
    });

    test('getCurrentWeather should throw CacheDataNotFoundException if data is not found', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);

      // Act
      final call = dataSource.getCurrentWeather;

      // Assert
      expect(() => call(tLat, tLon, tDateTime), throwsA(isA<CacheDataNotFoundException>()));
    });

    test('getCurrentWeather should throw CacheStorageException for unexpected errors', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(any())).thenThrow(Exception());

      // Act
      final call = dataSource.getCurrentWeather;

      // Assert
      expect(() => call(tLat, tLon, tDateTime), throwsA(isA<CacheStorageException>()));
    });

    test('cacheNextDayWeatherModelList should call SharedPreferences to cache data', () async {
      // Arrange
      when(() => mockSharedPreferences.setString(any(), any()))
          .thenAnswer((_) => Future.value(true));

      // Act
      await dataSource.cacheNextDayWeatherModelList(tLat, tLon, tDateTime.formatDay(), tNextDayWeatherModelList);

      // Assert
      verify(() => mockSharedPreferences.setString(any(), any())).called(1);
    });

    test('getNextDayWeatherModelList should return a list of NextDayWeatherModel from SharedPreferences', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(any()))
          .thenReturn(jsonEncode(tNextDayWeatherModelList.map((model) => model.toJson()).toList()));

      // Act
      final result = await dataSource.getNextDayWeatherModelList(tLat, tLon, tDateTime.formatDay());

      // Assert
      expect(result, equals(tNextDayWeatherModelList));
    });

    test('getNextDayWeatherModelList should return an empty list if data is not found', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);

      // Act
      final result = await dataSource.getNextDayWeatherModelList(tLat, tLon, tDateTime.formatDay());

      // Assert
      expect(result, equals([]));
    });

    test('getNextDayWeatherModelList should throw CacheStorageException for unexpected errors', () async {
      // Arrange
      when(() => mockSharedPreferences.getString(any())).thenThrow(Exception());

      // Act
      final call = dataSource.getNextDayWeatherModelList;

      // Assert
      expect(() => call(tLat, tLon, tDateTime.formatDay()), throwsA(isA<CacheStorageException>()));
    });
  });
}