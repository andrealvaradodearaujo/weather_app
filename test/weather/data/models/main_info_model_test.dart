import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/main_info_model.dart';

class MockEquatable extends Mock with EquatableMixin {}

void main() {
  group('MainInfoModel', () {
    test('toJson should return a valid map', () {
      // Arrange
      const mainInfoModel = MainInfoModel(25.0, 28.0, 22.0, 30.0, 1015.0, 1015.0, 1015.0, 60.0);

      // Act
      final result = mainInfoModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result['temp'], 25.0);
      expect(result['feels_like'], 28.0);
      expect(result['temp_min'], 22.0);
      expect(result['temp_max'], 30.0);
      expect(result['pressure'], 1015.0);
      expect(result['sea_level'], 1015.0);
      expect(result['grnd_level'], 1015.0);
      expect(result['humidity'], 60.0);
    });

    test('fromJson should create a valid MainInfoModel from a map', () {
      // Arrange
      const jsonData = {
        'temp': 25.0,
        'feels_like': 28.0,
        'temp_min': 22.0,
        'temp_max': 30.0,
        'pressure': 1015.0,
        'sea_level': 1015.0,
        'grnd_level': 1015.0,
        'humidity': 60.0,
      };

      // Act
      final result = MainInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<MainInfoModel>());
      expect(result.temp, 25.0);
      expect(result.feelsLike, 28.0);
      expect(result.tempMin, 22.0);
      expect(result.tempMax, 30.0);
      expect(result.pressure, 1015.0);
      expect(result.seaLevel, 1015.0);
      expect(result.grndLevel, 1015.0);
      expect(result.humidity, 60.0);
    });

    test('fromJson should create a valid MainInfoModel from a map with null values', () {
      // Arrange
      const jsonData = {
        'temp': null,
        'feelsLike': null,
        'tempMin': null,
        'tempMax': null,
        'pressure': null,
        'seaLevel': null,
        'grndLevel': null,
        'humidity': null,
      };

      // Act
      final result = MainInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<MainInfoModel>());
      expect(result.temp, isNull);
      expect(result.feelsLike, isNull);
      expect(result.tempMin, isNull);
      expect(result.tempMax, isNull);
      expect(result.pressure, isNull);
      expect(result.seaLevel, isNull);
      expect(result.grndLevel, isNull);
      expect(result.humidity, isNull);
    });

    test('props should return a list of all object properties', () {
      // Arrange
      const mainInfoModel = MainInfoModel(25.0, 28.0, 22.0, 30.0, 1015.0, 1015.0, 1015.0, 60.0);

      // Act
      final result = mainInfoModel.props;

      // Assert
      expect(result, containsAllInOrder([25.0, 28.0, 22.0, 30.0, 1015.0, 1015.0, 1015.0, 60.0]));
    });

    test('props should return a list of all object properties with null values', () {
      // Arrange
      const mainInfoModel = MainInfoModel(null, null, null, null, null, null, null, null);

      // Act
      final result = mainInfoModel.props;

      // Assert
      expect(result, containsAllInOrder([null, null, null, null, null, null, null, null]));
    });

    test('props should return distinct lists for distinct instances', () {
      // Arrange
      const mainInfoModel1 = MainInfoModel(25.0, 28.0, 22.0, 30.0, 1015.0, 1015.0, 1015.0, 60.0);
      const mainInfoModel2 = MainInfoModel(30.0, 32.0, 28.0, 35.0, 1020.0, 1020.0, 1020.0, 65.0);

      // Act
      final result1 = mainInfoModel1.props;
      final result2 = mainInfoModel2.props;

      // Assert
      expect(result1, isNot(same(result2)));
    });
  });
}
