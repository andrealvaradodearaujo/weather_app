import 'dart:collection';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/weather/domain/entities/next_days_forecast.dart';

class MockDateTime extends Mock implements DateTime {}

void main() {
  group('NextDaysForecast', () {
    late MockDateTime mockDateTime;
    final dt = DateTime.now();

    setUp(() {
      mockDateTime = MockDateTime();
      when(() => mockDateTime.toLocal()).thenReturn(DateTime(2023, 1, 1));
    });

    test('should initialize correctly', () {
      final nextDayWeather = NextDayWeather(
        temp: 26.0,
        feelsLike: 25.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1015.0,
        seaLevel: 1018.0,
        grndLevel: 1010.0,
        pop: 0.2,
        humidity: 70.0,
        mainGroupWeather: 'Clouds',
        description: 'Scattered clouds',
        iconUrl: 'http://example.com/icon.png',
        windSpeed: 5.0,
        windDeg: 180.0,
        windGust: 8.0,
        cloudsAll: 40.0,
        visibility: 10000.0,
        rainThreeHours: 0.0,
        snowThreeHours: 0.0,
        dt: dt,
      );

      final map = SplayTreeMap<DateTime, List<NextDayWeather>>();
      map[dt] = [nextDayWeather];

      final nextDaysForecast = NextDaysForecast(
        map: map,
      );

      expect(nextDaysForecast, isA<NextDaysForecast>());
      expect(nextDaysForecast.map, equals(map));
    });

    test('should handle null values correctly', () {
      final nextDaysForecast = NextDaysForecast(map: SplayTreeMap<DateTime, List<NextDayWeather>>());

      expect(nextDaysForecast.map, isEmpty);
    });

    test('should implement equality correctly', () {
      final nextDayWeather = NextDayWeather(
        temp: 26.0,
        feelsLike: 25.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1015.0,
        seaLevel: 1018.0,
        grndLevel: 1010.0,
        pop: 0.2,
        humidity: 70.0,
        mainGroupWeather: 'Clouds',
        description: 'Scattered clouds',
        iconUrl: 'http://example.com/icon.png',
        windSpeed: 5.0,
        windDeg: 180.0,
        windGust: 8.0,
        cloudsAll: 40.0,
        visibility: 10000.0,
        rainThreeHours: 0.0,
        snowThreeHours: 0.0,
        dt: DateTime(2023, 1, 2),
      );

      final map1 = SplayTreeMap<DateTime, List<NextDayWeather>>();
      map1[dt] = [nextDayWeather];

      final nextDaysForecast1 = NextDaysForecast(
        map: map1,
      );

      final map2 = SplayTreeMap<DateTime, List<NextDayWeather>>();
      map2[dt] = [nextDayWeather];

      final nextDaysForecast2 = NextDaysForecast(
        map: map2,
      );

      expect(nextDaysForecast1, equals(nextDaysForecast2));
    });
  });
}
