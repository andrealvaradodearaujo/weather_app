import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/wind_info_model.dart';

class MockWindInfoModel extends Mock implements WindInfoModel {}

void main() {
  group('WindInfoModel', () {
    test('props should consider all properties', () {
      // Arrange
      const speed = 10.0;
      const deg = 180.0;
      const gust = 15.0;

      // Act
      const windInfoModel = WindInfoModel(speed, deg, gust);

      // Assert
      expect(windInfoModel.props, equals([speed, deg, gust]));
    });

    test('props should not consider null values', () {
      // Arrange
      const windInfoModelWithNull = WindInfoModel(null, null, null);

      // Act
      final result = windInfoModelWithNull.props;

      // Assert
      expect(result, equals([null, null, null]));
    });

    test('fromJson should create an instance from JSON', () {
      // Arrange
      const json = {'speed': 10.0, 'deg': 180.0, 'gust': 15.0};

      // Act
      final result = WindInfoModel.fromJson(json);

      // Assert
      expect(result, isA<WindInfoModel>());
      expect(result.speed, equals(json['speed']));
      expect(result.deg, equals(json['deg']));
      expect(result.gust, equals(json['gust']));
    });

    test('toJson should convert instance to JSON', () {
      // Arrange
      const windInfoModel = WindInfoModel(10.0, 180.0, 15.0);

      // Act
      final result = windInfoModel.toJson();

      // Assert
      expect(result, equals({'speed': 10.0, 'deg': 180.0, 'gust': 15.0}));
    });
  });
}
