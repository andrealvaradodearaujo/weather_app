import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/cities/domain/repositories/cities_repository.dart';
import 'package:weather_app/features/cities/domain/usecases/get_cities_use_case.dart';

class MockCitiesRepository extends Mock implements CitiesRepository {}

void main() {
  group('GetCitiesUseCase', () {
    late GetCitiesUseCase getCitiesUseCase;
    late MockCitiesRepository mockCitiesRepository;

    setUp(() {
      mockCitiesRepository = MockCitiesRepository();
      getCitiesUseCase = GetCitiesUseCase(mockCitiesRepository);
    });

    test('call should return a list of cities from the repository', () {
      // Arrange
      const expectedCities = ['City1', 'City2', 'City3'];
      when(() => mockCitiesRepository.getCities()).thenReturn(expectedCities);

      // Act
      final result = getCitiesUseCase();

      // Assert
      expect(result, expectedCities);
      verify(() => mockCitiesRepository.getCities()).called(1);
    });

    test('call should return an empty list if the repository returns null', () {
      // Arrange
      when(() => mockCitiesRepository.getCities()).thenReturn([]);

      // Act
      final result = getCitiesUseCase();

      // Assert
      expect(result, isEmpty);
      verify(() => mockCitiesRepository.getCities()).called(1);
    });

    test('call should return an empty list if the repository returns an empty list', () {
      // Arrange
      when(() => mockCitiesRepository.getCities()).thenReturn([]);

      // Act
      final result = getCitiesUseCase();

      // Assert
      expect(result, isEmpty);
      verify(() => mockCitiesRepository.getCities()).called(1);
    });
  });
}
