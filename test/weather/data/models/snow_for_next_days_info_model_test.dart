import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/snow_for_next_days_info_model.dart';

class MockJsonMap extends Mock implements Map<String, dynamic> {}

void main() {
  group('SnowForNextDaysInfoModel', () {
    late SnowForNextDaysInfoModel snowForNextDaysInfoModel;

    setUp(() {
      snowForNextDaysInfoModel = const SnowForNextDaysInfoModel(2.0);
    });

    test('toJson should return a valid map', () {
      // Act
      final result = snowForNextDaysInfoModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['3h'], 2.0);
    });

    test('fromJson should create a valid SnowForNextDaysInfoModel from a map', () {
      // Arrange
      final jsonData = {'3h': 2.0};

      // Act
      final result = SnowForNextDaysInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<SnowForNextDaysInfoModel>());
      expect(result.threeHours, 2.0);
    });

    test('fromJson should handle null values', () {
      // Arrange
      final jsonData = <String, dynamic>{};

      // Act
      final result = SnowForNextDaysInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<SnowForNextDaysInfoModel>());
      expect(result.threeHours, isNull);
    });

    test('fromJson should handle invalid map structure', () {
      // Arrange
      final jsonData = {'invalid_key': 'value'};

      // Act
      final result = SnowForNextDaysInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<SnowForNextDaysInfoModel>());
      expect(result.threeHours, isNull);
    });

    test('props should return a list of correct props', () {
      // Arrange
      final expectedProps = [2.0];

      // Act
      final result = snowForNextDaysInfoModel.props;

      // Assert
      expect(result, equals(expectedProps));
    });
  });
}
