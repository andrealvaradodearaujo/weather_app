import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/domain/entities/next_day_weather.dart';

class MockDateTime extends Mock implements DateTime {}

void main() {
  group('NextDayWeather', () {
    late MockDateTime mockDateTime;

    setUp(() {
      mockDateTime = MockDateTime();
      when(() => mockDateTime.toLocal()).thenReturn(DateTime(2023, 1, 1));
    });

    test('should initialize correctly', () {
      final nextDayWeather = NextDayWeather(
        temp: 25.0,
        feelsLike: 24.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1015.0,
        seaLevel: 1018.0,
        grndLevel: 1010.0,
        humidity: 70.0,
        pop: 30.0,
        mainGroupWeather: 'Clear',
        description: 'Clear sky',
        iconUrl: 'http://example.com/icon.png',
        windSpeed: 5.0,
        windDeg: 180.0,
        windGust: 8.0,
        cloudsAll: 10.0,
        visibility: 10000.0,
        rainThreeHours: 0.0,
        snowThreeHours: 0.0,
        dt: mockDateTime,
      );

      expect(nextDayWeather, isA<NextDayWeather>());
      expect(nextDayWeather.temp, 25.0);
      expect(nextDayWeather.feelsLike, 24.0);
      expect(nextDayWeather.tempMin, 20.0);
      expect(nextDayWeather.tempMax, 30.0);
      expect(nextDayWeather.pressure, 1015.0);
      expect(nextDayWeather.seaLevel, 1018.0);
      expect(nextDayWeather.grndLevel, 1010.0);
      expect(nextDayWeather.humidity, 70.0);
      expect(nextDayWeather.pop, 30.0);
      expect(nextDayWeather.mainGroupWeather, 'Clear');
      expect(nextDayWeather.description, 'Clear sky');
      expect(nextDayWeather.iconUrl, 'http://example.com/icon.png');
      expect(nextDayWeather.windSpeed, 5.0);
      expect(nextDayWeather.windDeg, 180.0);
      expect(nextDayWeather.windGust, 8.0);
      expect(nextDayWeather.cloudsAll, 10.0);
      expect(nextDayWeather.visibility, 10000.0);
      expect(nextDayWeather.rainThreeHours, 0.0);
      expect(nextDayWeather.snowThreeHours, 0.0);
      expect(nextDayWeather.dt, mockDateTime);
    });

    test('should handle null values correctly', () {
      final nextDayWeather = NextDayWeather(dt: mockDateTime);

      expect(nextDayWeather.temp, isNull);
      expect(nextDayWeather.feelsLike, isNull);
      expect(nextDayWeather.tempMin, isNull);
      expect(nextDayWeather.tempMax, isNull);
      expect(nextDayWeather.pressure, isNull);
      expect(nextDayWeather.seaLevel, isNull);
      expect(nextDayWeather.grndLevel, isNull);
      expect(nextDayWeather.humidity, isNull);
      expect(nextDayWeather.pop, isNull);
      expect(nextDayWeather.mainGroupWeather, isNull);
      expect(nextDayWeather.description, isNull);
      expect(nextDayWeather.iconUrl, isNull);
      expect(nextDayWeather.windSpeed, isNull);
      expect(nextDayWeather.windDeg, isNull);
      expect(nextDayWeather.windGust, isNull);
      expect(nextDayWeather.cloudsAll, isNull);
      expect(nextDayWeather.visibility, isNull);
      expect(nextDayWeather.rainThreeHours, isNull);
      expect(nextDayWeather.snowThreeHours, isNull);
      expect(nextDayWeather.dt, mockDateTime);
    });

    test('should implement equality correctly', () {
      final dt = DateTime.now();

      final nextDayWeather1 = NextDayWeather(
        temp: 25.0,
        feelsLike: 24.0,
        tempMin: 23.0,
        tempMax: 26.0,
        pressure: 1010.0,
        seaLevel: 1012.0,
        grndLevel: 1008.0,
        humidity: 70.0,
        pop: 30.0,
        mainGroupWeather: 'Clear',
        description: 'Clear sky',
        iconUrl: 'http://example.com/icon.png',
        windSpeed: 5.0,
        windDeg: 180.0,
        windGust: 8.0,
        cloudsAll: 10.0,
        visibility: 10.0,
        rainThreeHours: 0.0,
        snowThreeHours: 0.0,
        dt: dt,
      );

      final nextDayWeather2 = NextDayWeather(
        temp: 25.0,
        feelsLike: 24.0,
        tempMin: 23.0,
        tempMax: 26.0,
        pressure: 1010.0,
        seaLevel: 1012.0,
        grndLevel: 1008.0,
        humidity: 70.0,
        pop: 30.0,
        mainGroupWeather: 'Clear',
        description: 'Clear sky',
        iconUrl: 'http://example.com/icon.png',
        windSpeed: 5.0,
        windDeg: 180.0,
        windGust: 8.0,
        cloudsAll: 10.0,
        visibility: 10.0,
        rainThreeHours: 0.0,
        snowThreeHours: 0.0,
        dt: dt,
      );

      expect(nextDayWeather1, equals(nextDayWeather2));
    });
  });
}
