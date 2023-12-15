import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/rain_for_current_info_model.dart';

class MockJsonMap extends Mock implements Map<String, dynamic> {}

void main() {
  group('RainForCurrentInfoModel', () {
    late RainForCurrentInfoModel rainForCurrentInfoModel;

    setUp(() {
      rainForCurrentInfoModel = const RainForCurrentInfoModel(0.5, 1.0);
    });

    test('toJson should return a valid map', () {
      // Act
      final result = rainForCurrentInfoModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['1h'], 0.5);
      expect(result['3h'], 1.0);
    });

    test('fromJson should create a valid RainForCurrentInfoModel from a map', () {
      // Arrange
      final jsonData = {'1h': 0.5, '3h': 1.0};

      // Act
      final result = RainForCurrentInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<RainForCurrentInfoModel>());
      expect(result.oneHour, 0.5);
      expect(result.threeHours, 1.0);
    });

    test('fromJson should handle null values', () {
      // Arrange
      final jsonData = <String, dynamic>{};

      // Act
      final result = RainForCurrentInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<RainForCurrentInfoModel>());
      expect(result.oneHour, isNull);
      expect(result.threeHours, isNull);
    });

    test('fromJson should handle invalid map structure', () {
      // Arrange
      final jsonData = {'invalid_key': 'value'};

      // Act
      final result = RainForCurrentInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<RainForCurrentInfoModel>());
      expect(result.oneHour, isNull);
      expect(result.threeHours, isNull);
    });

    test('props should return a list of correct props', () {
      // Arrange
      final expectedProps = [0.5, 1.0];

      // Act
      final result = rainForCurrentInfoModel.props;

      // Assert
      expect(result, equals(expectedProps));
    });
  });
}
