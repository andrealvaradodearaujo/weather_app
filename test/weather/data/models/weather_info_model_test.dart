import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/weather_info_model.dart';

class MockJsonMap extends Mock implements Map<String, dynamic> {}

void main() {
  group('WeatherInfoModel', () {
    late WeatherInfoModel weatherInfoModel;

    setUp(() {
      weatherInfoModel = const WeatherInfoModel('Clear', 'Clear sky', '01d');
    });

    test('toJson should return a valid map', () {
      // Act
      final result = weatherInfoModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['main'], 'Clear');
      expect(result['description'], 'Clear sky');
      expect(result['icon'], '01d');
    });

    test('fromJson should create a valid WeatherInfoModel from a map', () {
      // Arrange
      final jsonData = {'main': 'Clear', 'description': 'Clear sky', 'icon': '01d'};

      // Act
      final result = WeatherInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<WeatherInfoModel>());
      expect(result.main, 'Clear');
      expect(result.description, 'Clear sky');
      expect(result.icon, '01d');
    });

    test('fromJson should handle null values', () {
      // Arrange
      final jsonData = <String, dynamic>{};

      // Act
      final result = WeatherInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<WeatherInfoModel>());
      expect(result.main, isNull);
      expect(result.description, isNull);
      expect(result.icon, isNull);
    });

    test('props should return a list of correct props', () {
      // Arrange
      final expectedProps = ['Clear', 'Clear sky', '01d'];

      // Act
      final result = weatherInfoModel.props;

      // Assert
      expect(result, equals(expectedProps));
    });

    test('props should return an empty list for null values', () {
      // Arrange
      const weatherInfoModelWithNull = WeatherInfoModel(null, null, null);

      // Act
      final result = weatherInfoModelWithNull.props;

      // Assert
      expect(result, equals([null, null, null]));
    });
  });
}
