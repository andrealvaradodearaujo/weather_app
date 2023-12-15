import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/resources/settings.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_current_weather_use_case.dart';

/// Unit tests for the [GetCurrentWeatherUseCase] class.
///
/// This test suite covers various scenarios for the GetCurrentWeatherUseCase,
/// ensuring that it behaves correctly under different conditions, including
/// successful weather retrieval, handling invalid cities, and managing
/// repository failures.
///
/// The tests use the Mocktail library for creating mock objects.
///
/// Usage:
/// ```dart
/// pub run test test/weather/domain/usecases/get_current_weather_use_case_test.dart
/// ```
class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  // Declare variables
  late GetCurrentWeatherUseCase useCase;
  late MockWeatherRepository mockRepository;

  // Set up the test environment
  setUp(() {
    mockRepository = MockWeatherRepository();
    useCase = GetCurrentWeatherUseCase(mockRepository);
  });

  // Test scenarios

  /// Test case for getting the current weather for Silverstone, UK.
  test('should get current weather for Silverstone, UK', () async {
    // Arrange
    when(() => mockRepository.getCurrentWeather(any(), any()))
        .thenAnswer((_) async => const Right(CurrentWeather())); // Success case

    // Act
    final result = await useCase(Strings.citySilverstoneUK);

    // Assert
    expect(result, isA<Right<Failure, CurrentWeather>>());
    expect(result, const Right(CurrentWeather()));
    verify(() => mockRepository.getCurrentWeather(Settings.latSilverstoneUK, Settings.lonSilverstoneUK));
    verifyNoMoreInteractions(mockRepository);
  });

  /// Test case for getting the current weather for Sao Paulo, Brazil.
  test('should get current weather for Sao Paulo, Brazil', () async {
    // Arrange
    when(() => mockRepository.getCurrentWeather(any(), any()))
        .thenAnswer((_) async => const Right(CurrentWeather())); // Success case

    // Act
    final result = await useCase(Strings.citySaoPauloBrazil);

    // Assert
    expect(result, isA<Right<Failure, CurrentWeather>>());
    expect(result, const Right(CurrentWeather()));
    verify(() => mockRepository.getCurrentWeather(Settings.latSaoPauloBR, Settings.lonSaoPauloBR));
    verifyNoMoreInteractions(mockRepository);
  });

  /// Test case for handling an invalid city.
  test('should handle invalid city', () async {
    // Arrange

    // Act
    final result = await useCase('InvalidCity');

    // Assert
    expect(result, Left<Failure, CurrentWeather>(GenericFailure(Strings.invalidCity)));
    verifyZeroInteractions(mockRepository);
  });

  /// Additional test cases can be added here based on specific scenarios.

  /// Example test case for handling repository failure.
  test('should handle repository failure', () async {
    // Arrange
    when(() => mockRepository.getCurrentWeather(any(), any()))
        .thenAnswer((_) async => Left(ServerFailure(message: ''))); // Failure case

    // Act
    final result = await useCase(Strings.citySilverstoneUK);

    // Assert
    expect(result, isA<Left<Failure, CurrentWeather>>());
    expect(result, Left(ServerFailure(message: '')));
    verify(() => mockRepository.getCurrentWeather(Settings.latSilverstoneUK, Settings.lonSilverstoneUK));
    verifyNoMoreInteractions(mockRepository);
  });
}
