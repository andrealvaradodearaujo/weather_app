import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/clouds_info_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/main_info_model.dart';
import 'package:weather_app/features/weather/data/models/rain_for_current_info_model.dart';
import 'package:weather_app/features/weather/data/models/snow_for_current_info_model.dart';
import 'package:weather_app/features/weather/data/models/sys_info_model.dart';
import 'package:weather_app/features/weather/data/models/weather_info_model.dart';
import 'package:weather_app/features/weather/data/models/wind_info_model.dart';

class MockEquatable extends Mock implements Equatable {}

void main() {
  const currentWeatherModel = CurrentWeatherModel(
    MainInfoModel(0,0,0,0,0,0,0,0,),
    [WeatherInfoModel('','','',)],
    WindInfoModel(0,0,0),
    CloudsInfoModel(50),
    10000,
    RainForCurrentInfoModel(0,0),
    SnowForCurrentInfoModel(0,0),
    SysInfoModel('',0,0),
    1638826801,
    'Test City',
  );

  const model1 = CurrentWeatherModel(
    MainInfoModel(0,0,0,0,0,0,0,0,),
    [WeatherInfoModel('','','',)],
    WindInfoModel(0,0,0),
    CloudsInfoModel(50),
    10000,
    RainForCurrentInfoModel(0,0),
    SnowForCurrentInfoModel(0,0),
    SysInfoModel('',0,0),
    1638826800,
    'Test City',
  );

  const model2 = CurrentWeatherModel(
    MainInfoModel(0,0,0,0,0,0,0,0,),
    [WeatherInfoModel('','','',)],
    WindInfoModel(0,0,0),
    CloudsInfoModel(50),
    10000,
    RainForCurrentInfoModel(0,0),
    SnowForCurrentInfoModel(0,0),
    SysInfoModel('',0,0),
    1638826800,
    'Test City',
  );

  group('CurrentWeatherModel', () {
    test('toJson should return a valid map', () {
      // Act
      final result = currentWeatherModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['main'], isA<MainInfoModel>());
      expect(result['weather'], isA<List<WeatherInfoModel>>());
      expect(result['wind'], isA<WindInfoModel>());
      expect(result['clouds'], isA<CloudsInfoModel>());
      expect(result['visibility'], 10000);
      expect(result['rain'], isA<RainForCurrentInfoModel>());
      expect(result['snow'], isA<SnowForCurrentInfoModel>());
      expect(result['sys'], isA<SysInfoModel>());
      expect(result['dt'], 1638826801);
      expect(result['name'], 'Test City');
    });

    test('fromJson should create a valid CurrentWeatherModel from a map', () {
      // Arrange
      const jsonData = {
        'main': <String, dynamic>{},
        'weather': [<String, dynamic>{}],
        'wind': <String, dynamic>{},
        'clouds': {'all': 50},
        'visibility': 10000,
        'rain': <String, dynamic>{},
        'snow': <String, dynamic>{},
        'sys': <String, dynamic>{},
        'dt': 1638826800,
        'name': 'Test City',
      };

      // Act
      final result = CurrentWeatherModel.fromJson(jsonData);

      // Assert
      expect(result, isA<CurrentWeatherModel>());
      expect(result.main, isA<MainInfoModel>());
      expect(result.weather, isA<List<WeatherInfoModel>>());
      expect(result.wind, isA<WindInfoModel>());
      expect(result.clouds, isA<CloudsInfoModel>());
      expect(result.visibility, 10000);
      expect(result.rain, isA<RainForCurrentInfoModel>());
      expect(result.snow, isA<SnowForCurrentInfoModel>());
      expect(result.sys, isA<SysInfoModel>());
      expect(result.dt, 1638826800);
      expect(result.name, 'Test City');
    });

    test('props should return a list with the correct values', () {

      // Act
      final result = currentWeatherModel.props;

      // Assert
      expect(result, isA<List<Object?>>());
      expect(result, [
        currentWeatherModel.main,
        currentWeatherModel.weather,
        currentWeatherModel.wind,
        currentWeatherModel.clouds,
        currentWeatherModel.visibility,
        currentWeatherModel.rain,
        currentWeatherModel.snow,
        currentWeatherModel.sys,
        currentWeatherModel.dt,
        currentWeatherModel.name,
      ]);
    });

    test('CurrentWeatherModel instances with the same properties should be equal', () {
      // Act
      final result = model1 == model2;

      // Assert
      expect(result, true);
    });

    test('CurrentWeatherModel instances with different properties should not be equal', () {
      // Act
      final result = model1 == currentWeatherModel;

      // Assert
      expect(result, false);
    });

    test('hashCode should be the same for CurrentWeatherModel instances with the same properties', () {
      // Act
      final hashCode1 = model1.hashCode;
      final hashCode2 = model2.hashCode;

      // Assert
      expect(hashCode1, hashCode2);
    });

    test('hashCode should be different for CurrentWeatherModel instances with different properties', () {
      // Act
      final hashCode1 = model1.hashCode;
      final hashCode2 = currentWeatherModel.hashCode;

      // Assert
      expect(hashCode1, isNot(hashCode2));
    });

    test('Equatable extension should call props method', () {
      // Arrange
      final mockEquatable = MockEquatable();
      when(() => mockEquatable.props).thenReturn([]);

      // Act
      final _ = mockEquatable.props;

      // Assert
      verify(() => mockEquatable.props).called(1);
    });
  });
}