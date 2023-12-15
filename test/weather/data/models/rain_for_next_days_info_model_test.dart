import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/rain_for_next_days_info_model.dart';

class MockJsonMap extends Mock implements Map<String, dynamic> {}

void main() {
  group('RainForNextDaysInfoModel', () {
    late RainForNextDaysInfoModel rainForNextDaysInfoModel;

    setUp(() {
      rainForNextDaysInfoModel = const RainForNextDaysInfoModel(1.5);
    });

    test('toJson should return a valid map', () {
      // Act
      final result = rainForNextDaysInfoModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['3h'], 1.5);
    });

    test('fromJson should create a valid RainForNextDaysInfoModel from a map', () {
      // Arrange
      final jsonData = {'3h': 1.5};

      // Act
      final result = RainForNextDaysInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<RainForNextDaysInfoModel>());
      expect(result.threeHours, 1.5);
    });

    test('fromJson should handle null values', () {
      // Arrange
      final jsonData = <String, dynamic>{};

      // Act
      final result = RainForNextDaysInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<RainForNextDaysInfoModel>());
      expect(result.threeHours, isNull);
    });

    test('fromJson should handle invalid map structure', () {
      // Arrange
      final jsonData = {'invalid_key': 'value'};

      // Act
      final result = RainForNextDaysInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<RainForNextDaysInfoModel>());
      expect(result.threeHours, isNull);
    });

    test('props should return a list of correct props', () {
      // Arrange
      final expectedProps = [1.5];

      // Act
      final result = rainForNextDaysInfoModel.props;

      // Assert
      expect(result, equals(expectedProps));
    });
  });
}
