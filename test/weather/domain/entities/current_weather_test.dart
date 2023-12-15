import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';

class MockDateTime extends Mock implements DateTime {}

void main() {
  group('CurrentWeather', () {
    late MockDateTime mockDateTime;

    setUp(() {
      mockDateTime = MockDateTime();
      when(() => mockDateTime.toLocal()).thenReturn(DateTime(2023, 1, 1));
    });

    test('should initialize correctly', () {
      final currentWeather = CurrentWeather(
        temp: 25.0,
        feelsLike: 24.0,
        tempMin: 20.0,
        tempMax: 30.0,
        pressure: 1015.0,
        seaLevel: 1018.0,
        grndLevel: 1010.0,
        humidity: 70.0,
        mainGroupWeather: 'Clear',
        description: 'Clear sky',
        iconUrl: 'http://example.com/icon.png',
        windSpeed: 5.0,
        windDeg: 180.0,
        windGust: 8.0,
        cloudsAll: 10.0,
        visibility: 10000.0,
        rainOneHour: 0.0,
        rainThreeHours: 0.0,
        snowOneHour: 0.0,
        snowThreeHours: 0.0,
        country: 'US',
        sunrise: mockDateTime,
        sunset: mockDateTime,
        dt: mockDateTime,
        cityName: 'New York',
      );

      expect(currentWeather, isA<CurrentWeather>());
      expect(currentWeather.temp, 25.0);
      expect(currentWeather.feelsLike, 24.0);
      expect(currentWeather.tempMin, 20.0);
      expect(currentWeather.tempMax, 30.0);
      expect(currentWeather.pressure, 1015.0);
      expect(currentWeather.seaLevel, 1018.0);
      expect(currentWeather.grndLevel, 1010.0);
      expect(currentWeather.humidity, 70.0);
      expect(currentWeather.mainGroupWeather, 'Clear');
      expect(currentWeather.description, 'Clear sky');
      expect(currentWeather.iconUrl, 'http://example.com/icon.png');
      expect(currentWeather.windSpeed, 5.0);
      expect(currentWeather.windDeg, 180.0);
      expect(currentWeather.windGust, 8.0);
      expect(currentWeather.cloudsAll, 10.0);
      expect(currentWeather.visibility, 10000.0);
      expect(currentWeather.rainOneHour, 0.0);
      expect(currentWeather.rainThreeHours, 0.0);
      expect(currentWeather.snowOneHour, 0.0);
      expect(currentWeather.snowThreeHours, 0.0);
      expect(currentWeather.country, 'US');
      expect(currentWeather.sunrise, mockDateTime);
      expect(currentWeather.sunset, mockDateTime);
      expect(currentWeather.dt, mockDateTime);
      expect(currentWeather.cityName, 'New York');
    });

    test('should handle null values correctly', () {
      const currentWeather = CurrentWeather();

      expect(currentWeather.temp, isNull);
      expect(currentWeather.feelsLike, isNull);
      expect(currentWeather.tempMin, isNull);
      expect(currentWeather.tempMax, isNull);
      expect(currentWeather.pressure, isNull);
      expect(currentWeather.seaLevel, isNull);
      expect(currentWeather.grndLevel, isNull);
      expect(currentWeather.humidity, isNull);
      expect(currentWeather.mainGroupWeather, isNull);
      expect(currentWeather.description, isNull);
      expect(currentWeather.iconUrl, isNull);
      expect(currentWeather.windSpeed, isNull);
      expect(currentWeather.windDeg, isNull);
      expect(currentWeather.windGust, isNull);
      expect(currentWeather.cloudsAll, isNull);
      expect(currentWeather.visibility, isNull);
      expect(currentWeather.rainOneHour, isNull);
      expect(currentWeather.rainThreeHours, isNull);
      expect(currentWeather.snowOneHour, isNull);
      expect(currentWeather.snowThreeHours, isNull);
      expect(currentWeather.country, isNull);
      expect(currentWeather.sunrise, isNull);
      expect(currentWeather.sunset, isNull);
      expect(currentWeather.dt, isNull);
      expect(currentWeather.cityName, isNull);
    });

    test('should implement equality correctly', () {
      final sunriseDt = DateTime.now();
      final sunsetDt = DateTime.now().add(const Duration(hours: 12));
      final dt = DateTime.now();

      final currentWeather1 = CurrentWeather(
        temp: 25.0,
        feelsLike: 24.0,
        tempMin: 23.0,
        tempMax: 26.0,
        pressure: 1010.0,
        seaLevel: 1012.0,
        grndLevel: 1008.0,
        humidity: 70.0,
        mainGroupWeather: 'Clear',
        description: 'Clear sky',
        iconUrl: 'http://example.com/icon.png',
        windSpeed: 5.0,
        windDeg: 180.0,
        windGust: 8.0,
        cloudsAll: 10.0,
        visibility: 10.0,
        rainOneHour: 0.0,
        rainThreeHours: 0.0,
        snowOneHour: 0.0,
        snowThreeHours: 0.0,
        country: 'US',
        sunrise: sunriseDt,
        sunset: sunsetDt,
        dt: dt,
        cityName: 'New York',
      );

      final currentWeather2 = CurrentWeather(
        temp: 25.0,
        feelsLike: 24.0,
        tempMin: 23.0,
        tempMax: 26.0,
        pressure: 1010.0,
        seaLevel: 1012.0,
        grndLevel: 1008.0,
        humidity: 70.0,
        mainGroupWeather: 'Clear',
        description: 'Clear sky',
        iconUrl: 'http://example.com/icon.png',
        windSpeed: 5.0,
        windDeg: 180.0,
        windGust: 8.0,
        cloudsAll: 10.0,
        visibility: 10.0,
        rainOneHour: 0.0,
        rainThreeHours: 0.0,
        snowOneHour: 0.0,
        snowThreeHours: 0.0,
        country: 'US',
        sunrise: sunriseDt,
        sunset: sunsetDt,
        dt: dt,
        cityName: 'New York',
      );

      expect(currentWeather1, equals(currentWeather2));
    });
  });
}
