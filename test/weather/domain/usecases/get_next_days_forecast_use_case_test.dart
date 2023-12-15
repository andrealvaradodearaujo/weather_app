import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/weather/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/weather/domain/entities/next_days_forecast.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_next_days_forecast_use_case.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetNextDaysForecastUseCase useCase;
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
    useCase = GetNextDaysForecastUseCase(mockRepository);
  });

  group('GetNextDaysForecastUseCase', () {
    test('should retrieve next days forecast successfully', () async {
      // Arrange
      const city = Strings.citySaoPauloBrazil;
      final expectedForecast = NextDaysForecast(map: SplayTreeMap<DateTime, List<NextDayWeather>>());

      when(() => mockRepository.getNextDaysForecast(any(), any()))
          .thenAnswer((_) async => Right(expectedForecast));

      // Act
      final result = await useCase(city);

      // Assert
      expect(result, Right(expectedForecast)); // Adjusted expectation
      verify(() => mockRepository.getNextDaysForecast(any(), any())).called(1);
      verifyNoMoreInteractions(mockRepository);
    });


    test('should handle invalid city', () async {
      // Arrange
      const invalidCity = 'InvalidCity';

      // Act
      final result = await useCase(invalidCity);

      // Assert
      expect(result, Left(GenericFailure(Strings.invalidCity)));
      verifyZeroInteractions(mockRepository);
    });

    test('should handle repository failure', () async {
      // Arrange
      const city = Strings.citySaoPauloBrazil;
      final expectedFailure = ServerFailure(message: ''); // Use any Failure type you have

      when(() => mockRepository.getNextDaysForecast(any(), any()))
          .thenAnswer((_) async => Left(expectedFailure));

      // Act
      final result = await useCase(city);

      // Assert
      expect(result, Left(expectedFailure));
      verify(() => mockRepository.getNextDaysForecast(any(), any())).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
