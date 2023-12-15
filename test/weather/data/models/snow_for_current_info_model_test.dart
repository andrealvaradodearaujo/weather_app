import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/snow_for_current_info_model.dart';

class MockJsonMap extends Mock implements Map<String, dynamic> {}

void main() {
  group('SnowForCurrentInfoModel', () {
    late SnowForCurrentInfoModel snowForCurrentInfoModel;

    setUp(() {
      snowForCurrentInfoModel = const SnowForCurrentInfoModel(0.8, 2.0);
    });

    test('toJson should return a valid map', () {
      // Act
      final result = snowForCurrentInfoModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['1h'], 0.8);
      expect(result['3h'], 2.0);
    });

    test('fromJson should create a valid SnowForCurrentInfoModel from a map', () {
      // Arrange
      final jsonData = {'1h': 0.8, '3h': 2.0};

      // Act
      final result = SnowForCurrentInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<SnowForCurrentInfoModel>());
      expect(result.oneHour, 0.8);
      expect(result.threeHours, 2.0);
    });

    test('fromJson should handle null values', () {
      // Arrange
      final jsonData = <String, dynamic>{};

      // Act
      final result = SnowForCurrentInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<SnowForCurrentInfoModel>());
      expect(result.oneHour, isNull);
      expect(result.threeHours, isNull);
    });

    test('fromJson should handle invalid map structure', () {
      // Arrange
      final jsonData = {'invalid_key': 'value'};

      // Act
      final result = SnowForCurrentInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<SnowForCurrentInfoModel>());
      expect(result.oneHour, isNull);
      expect(result.threeHours, isNull);
    });

    test('props should return a list of correct props', () {
      // Arrange
      final expectedProps = [0.8, 2.0];

      // Act
      final result = snowForCurrentInfoModel.props;

      // Assert
      expect(result, equals(expectedProps));
    });
  });
}
