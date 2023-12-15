import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/clouds_info_model.dart';
import 'package:weather_app/features/weather/data/models/main_info_model.dart';
import 'package:weather_app/features/weather/data/models/rain_for_next_days_info_model.dart';
import 'package:weather_app/features/weather/data/models/snow_for_next_days_info_model.dart';
import 'package:weather_app/features/weather/data/models/weather_info_model.dart';
import 'package:weather_app/features/weather/data/models/wind_info_model.dart';
import 'package:weather_app/features/weather/data/models/next_day_weather_model.dart';

class MockMainInfoModel extends Mock implements MainInfoModel {}
class MockWeatherInfoModel extends Mock implements WeatherInfoModel {}
class MockWindInfoModel extends Mock implements WindInfoModel {}
class MockCloudsInfoModel extends Mock implements CloudsInfoModel {}
class MockRainForNextDaysInfoModel extends Mock implements RainForNextDaysInfoModel {}
class MockSnowForNextDaysInfoModel extends Mock implements SnowForNextDaysInfoModel {}

void main() {
  group('NextDayWeatherModel', () {
    late NextDayWeatherModel nextDayWeatherModel;

    setUp(() {
      nextDayWeatherModel = NextDayWeatherModel(
        MockMainInfoModel(),
        [MockWeatherInfoModel()],
        MockWindInfoModel(),
        MockCloudsInfoModel(),
        10000,
        MockRainForNextDaysInfoModel(),
        MockSnowForNextDaysInfoModel(),
        0.5,
        1638826800,
      );
    });

    test('toJson should return a valid map', () {
      // Act
      final result = nextDayWeatherModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['main'], isA<MainInfoModel>());
      expect(result['weather'], isA<List<WeatherInfoModel>>());
      expect(result['wind'], isA<WindInfoModel>());
      expect(result['clouds'], isA<CloudsInfoModel>());
      expect(result['visibility'], 10000);
      expect(result['rain'], isA<RainForNextDaysInfoModel>());
      expect(result['snow'], isA<SnowForNextDaysInfoModel>());
      expect(result['pop'], 0.5);
      expect(result['dt'], 1638826800);
    });

    test('fromJson should create a valid NextDayWeatherModel from a map', () {
      // Arrange
      const jsonData = {
        'main': <String, dynamic>{},
        'weather': <Map<String, dynamic>>[{}],
        'wind': <String, dynamic>{},
        'clouds': {'all': 50},
        'visibility': 10000,
        'rain': <String, dynamic>{},
        'snow': <String, dynamic>{},
        'pop': 0.5,
        'dt': 1638826800,
      };

      // Act
      final result = NextDayWeatherModel.fromJson(jsonData);

      // Assert
      expect(result, isA<NextDayWeatherModel>());
      expect(result.main, isA<MainInfoModel>());
      expect(result.weather, isA<List<WeatherInfoModel>>());
      expect(result.wind, isA<WindInfoModel>());
      expect(result.clouds, isA<CloudsInfoModel>());
      expect(result.visibility, 10000);
      expect(result.rain, isA<RainForNextDaysInfoModel>());
      expect(result.snow, isA<SnowForNextDaysInfoModel>());
      expect(result.pop, 0.5);
      expect(result.dt, 1638826800);
    });

    test('listFromJson should create a list of NextDayWeatherModel from a list of maps', () {
      // Arrange
      const jsonArray = [
        {'main': <String, dynamic>{}, 'weather': <Map<String, dynamic>>[{}], 'wind': <String, dynamic>{}, 'clouds': {'all': 50}, 'visibility': 10000, 'rain': <String, dynamic>{}, 'snow': <String, dynamic>{}, 'pop': 0.5, 'dt': 1638826800},
        // Add more items as needed
      ];

      // Act
      final resultList = NextDayWeatherModel.listFromJson(jsonArray);

      // Assert
      expect(resultList, isA<List<NextDayWeatherModel>>());
      // Add assertions for individual items in the list
      expect(resultList[0], isA<NextDayWeatherModel>());
    });
  });
}
