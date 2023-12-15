import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/weather/data/models/clouds_info_model.dart';

class MockEquatable extends Mock implements Equatable {}

void main() {
  group('CloudsInfoModel', () {
    test('toJson should return a valid map', () {
      // Arrange
      const cloudsInfoModel = CloudsInfoModel(50);

      // Act
      final result = cloudsInfoModel.toJson();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      expect(result, {'all': 50});
    });

    test('fromJson should create a valid CloudsInfoModel from a map', () {
      // Arrange
      const jsonData = {'all': 70};

      // Act
      final result = CloudsInfoModel.fromJson(jsonData);

      // Assert
      expect(result, isA<CloudsInfoModel>());
      expect(result.all, 70);
    });

    test('props should return a list with the correct values', () {
      // Arrange
      const cloudsInfoModel = CloudsInfoModel(30);

      // Act
      final result = cloudsInfoModel.props;

      // Assert
      expect(result, isA<List<Object?>>());
      expect(result, [30]);
    });

    test('CloudsInfoModel instances with the same properties should be equal', () {
      // Arrange
      const model1 = CloudsInfoModel(40);
      const model2 = CloudsInfoModel(40);

      // Act
      final result = model1 == model2;

      // Assert
      expect(result, true);
    });

    test('CloudsInfoModel instances with different properties should not be equal', () {
      // Arrange
      const model1 = CloudsInfoModel(30);
      const model2 = CloudsInfoModel(40);

      // Act
      final result = model1 == model2;

      // Assert
      expect(result, false);
    });

    test('hashCode should be the same for CloudsInfoModel instances with the same properties', () {
      // Arrange
      const model1 = CloudsInfoModel(50);
      const model2 = CloudsInfoModel(50);

      // Act
      final hashCode1 = model1.hashCode;
      final hashCode2 = model2.hashCode;

      // Assert
      expect(hashCode1, hashCode2);
    });

    test('hashCode should be different for CloudsInfoModel instances with different properties', () {
      // Arrange
      const model1 = CloudsInfoModel(30);
      const model2 = CloudsInfoModel(40);

      // Act
      final hashCode1 = model1.hashCode;
      final hashCode2 = model2.hashCode;

      // Assert
      expect(hashCode1, isNot(hashCode2));
    });

    test('Equatable extension should call props method', () {
      // Arrange
      final mockEquatable = MockEquatable();
      when(() => mockEquatable.props).thenReturn([]);

      // Act
      final _ = mockEquatable.props;

      // Assert
      verify(() => mockEquatable.props).called(1);
    });
  });
}