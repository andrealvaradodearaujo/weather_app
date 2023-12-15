import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/cities/data/repositories/cities_repository_impl.dart';
import 'package:weather_app/features/cities/domain/repositories/cities_repository.dart';

class MockCitiesRepository extends Mock implements CitiesRepository {}

void main() {
  group('CitiesRepositoryImpl', () {
    late CitiesRepositoryImpl citiesRepository;

    setUp(() {
      citiesRepository = CitiesRepositoryImpl();
    });

    test('getCities should return a list of cities', () {
      // Act
      final cities = citiesRepository.getCities();

      // Assert
      expect(cities, isNotEmpty);
      expect(cities, containsAllInOrder([
        Strings.citySilverstoneUK,
        Strings.citySaoPauloBrazil,
        Strings.cityMelbourneAustralia,
        Strings.cityMonteCarloMonaco,
      ]));
    });

    test('getCities should return the correct number of cities', () {
      // Act
      final cities = citiesRepository.getCities();

      // Assert
      expect(cities.length, 4);
    });

    test('getCities should return a non-empty list', () {
      // Act
      final cities = citiesRepository.getCities();

      // Assert
      expect(cities, isNotEmpty);
    });

    test('getCities should return a list containing Silverstone, Sao Paulo, Melbourne, and Monte Carlo', () {
      // Act
      final cities = citiesRepository.getCities();

      // Assert
      expect(cities, contains(Strings.citySilverstoneUK));
      expect(cities, contains(Strings.citySaoPauloBrazil));
      expect(cities, contains(Strings.cityMelbourneAustralia));
      expect(cities, contains(Strings.cityMonteCarloMonaco));
    });
  });
}
