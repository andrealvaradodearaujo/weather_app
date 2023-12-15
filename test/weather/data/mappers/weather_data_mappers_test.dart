import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/resources/dart_extensions/date_extensions.dart';
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
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/next_day_weather.dart';

class MockMainInfoModel extends Mock implements MainInfoModel {}
class MockWeatherInfoModel extends Mock implements WeatherInfoModel {}
class MockWindInfoModel extends Mock implements WindInfoModel {}
class MockCloudsInfoModel extends Mock implements CloudsInfoModel {}
class MockSnowForCurrentInfoModel extends Mock implements SnowForCurrentInfoModel {}
class MockRainForCurrentInfoModel extends Mock implements RainForCurrentInfoModel {}
class MockSysInfoModel extends Mock implements SysInfoModel {}

void main() {
  group('CurrentWeatherModelDataMappers', () {
    late CurrentWeatherModel currentWeatherModel;

    setUp(() {
      currentWeatherModel = CurrentWeatherModel(
        MockMainInfoModel(),
        [MockWeatherInfoModel()],
        MockWindInfoModel(),
        MockCloudsInfoModel(),
        10000,
        MockRainForCurrentInfoModel(),
        MockSnowForCurrentInfoModel(),
        MockSysInfoModel(),
        1638826800,
        'Test City',
      );
    });

    test('toCurrentWeather should return a valid CurrentWeather entity', () {
      // Arrange
      when(() => currentWeatherModel.main.temp).thenReturn(25.0);
      // Mock other property values accordingly

      // Act
      final result = currentWeatherModel.toCurrentWeather();

      // Assert
      expect(result, isA<CurrentWeather>());
      // Add assertions for other properties
    });

    test('_getDateTime should convert Unix timestamp to DateTime', () {
      // Arrange
      const unixTimestamp = 1638826800;

      // Act
      final result = unixTimestamp.getDateTimeFromUnixTimestamp();

      // Assert
      expect(result, isA<DateTime>());
      expect(result.millisecondsSinceEpoch, unixTimestamp * 1000);
    });
  });

  group('NextDayWeatherModelDataMappers', () {
    late NextDayWeatherModel nextDayWeatherModel;

    setUp(() {
      nextDayWeatherModel = NextDayWeatherModel(
        MockMainInfoModel(),
        [MockWeatherInfoModel()],
        MockWindInfoModel(),
        MockCloudsInfoModel(),
        10000,
        null,
        null,
        123,
        1638826800,
      );
    });

    test('toNextDayWeather should return a valid NextDayWeather entity', () {
      // Arrange
      when(() => nextDayWeatherModel.main.temp).thenReturn(22.0);

      // Act
      final result = nextDayWeatherModel.toNextDayWeather();

      // Assert
      expect(result, isA<NextDayWeather>());
      // Add assertions for other properties
    });

    test('_getDateTime should convert Unix timestamp to DateTime', () {
      // Arrange
      const unixTimestamp = 1638826800;

      // Act
      final result = unixTimestamp.getDateTimeFromUnixTimestamp();

      // Assert
      expect(result, isA<DateTime>());
      expect(result.millisecondsSinceEpoch, unixTimestamp * 1000);
    });
  });
}
