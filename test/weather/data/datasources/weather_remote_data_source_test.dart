import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/next_day_weather_model.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('WeatherRemoteDataSource', () {
    late WeatherRemoteDataSource remoteDataSource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      remoteDataSource = WeatherRemoteDataSource(mockDio);
    });

    const tLat = 37.7749;
    const tLon = -122.4194;

    test('getCurrentWeather should make a GET request to OpenWeatherMap API and return CurrentWeatherModel', () async {
      // Arrange
      final tResponseData = {
        'main': {
          'temp': 25.0,
          'feels_like': 28.0,
          'temp_min': 22.0,
          'temp_max': 30.0,
          'pressure': 1015,
          'sea_level': 1015,
          'grnd_level': 1015,
          'humidity': 60,
        },
        'weather': [
          {'main': 'Clear', 'description': 'Clear sky', 'icon': '01d'}
        ],
        'wind': {'speed': 5.0, 'deg': 180, 'gust': 8.0},
        'clouds': {'all': 10},
        'visibility': 10000.0,
        'rain': {'1h': 0.5, '3h': 1.0},
        'snow': {'1h': 0.1, '3h': 0.3},
        'sys': {'country': 'US', 'sunrise': 1638800000, 'sunset': 1638840000},
        'dt': 1638826800,
        'name': 'Test City',
      };

      when(() => mockDio.get(any())).thenAnswer((_) async => Response<Map<String, dynamic>>(
        data: tResponseData,
        requestOptions: RequestOptions(path: ''),
      ));

      // Act
      final result = await remoteDataSource.getCurrentWeather(tLat, tLon);

      // Assert
      expect(result, equals(CurrentWeatherModel.fromJson(tResponseData)));
      verify(() => mockDio.get(any()));
    });

    test('getCurrentWeather should throw ServerException on Dio error', () async {
      // Arrange
      when(() => mockDio.get(any())).thenThrow(DioError(
          requestOptions: RequestOptions(path: ''),
          response: Response(data: '', requestOptions: RequestOptions(path: ''))));

      // Act
      final call = remoteDataSource.getCurrentWeather;

      // Assert
      expect(() => call(tLat, tLon), throwsA(isA<ServerException>()));
    });

    test('getNextDaysForecast should make a GET request to OpenWeatherMap API and return a list of NextDayWeatherModel',
            () async {
          // Arrange
          final tResponseData = {
            'list': [
              {
                'main': {
                  'temp': 22.0,
                  'feels_like': 25.0,
                  'temp_min': 20.0,
                  'temp_max': 24.0,
                  'pressure': 1010,
                  'sea_level': 1015,
                  'grnd_level': 1015,
                  'humidity': 70,
                },
                'weather': [
                  {'main': 'Clouds', 'description': 'Few clouds', 'icon': '02d'}
                ],
                'wind': {'speed': 8.0, 'deg': 200, 'gust': 10.0},
                'clouds': {'all': 30},
                'visibility': 8000.0,
                'dt': 1638913200,
              }
            ]
          };
          when(() => mockDio.get(
            any(),
            queryParameters: any(named: 'queryParameters'), // Ajuste aqui
          )).thenAnswer((_) async =>
              Response<Map<String, dynamic>>(
                data: tResponseData,
                requestOptions: RequestOptions(path: ''),
              ));

          // Act
          final result = await remoteDataSource.getNextDaysForecast(tLat, tLon);

          // Assert
          expect(
            result,
            equals(NextDayWeatherModel.listFromJson(List<Map<String, Object>>.from(tResponseData['list'] as Iterable))),
          );
          // Ajuste aqui para permitir qualquer parâmetro
          verify(() => mockDio.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          ));
        });


    test('getNextDaysForecast should throw ServerException on Dio error', () async {
      // Arrange
      when(() => mockDio.get(any())).thenThrow(DioError(
          requestOptions: RequestOptions(path: ''),
          response: Response(data: '', requestOptions: RequestOptions(path: ''))));

      // Act
      final call = remoteDataSource.getNextDaysForecast;

      // Assert
      expect(() => call(tLat, tLon), throwsA(isA<ServerException>()));
    });
  });
}
