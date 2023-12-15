import 'dart:collection';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/weather/domain/entities/next_days_forecast.dart';
import 'package:weather_app/features/weather/domain/usecases/get_next_days_forecast_use_case.dart';
import 'package:weather_app/features/weather/presentation/bloc/next_days_forecast/next_days_forecast_bloc.dart';

class MockNextDaysForecastUseCase extends Mock implements GetNextDaysForecastUseCase {}

void main() {
  late NextDaysForecastBloc nextDaysForecastBloc;
  late MockNextDaysForecastUseCase mockNextDaysForecastUseCase;

  setUp(() {
    mockNextDaysForecastUseCase = MockNextDaysForecastUseCase();
    nextDaysForecastBloc = NextDaysForecastBloc(mockNextDaysForecastUseCase);
  });

  group('NextDaysForecastBloc', () {
    const city = 'TestCity';
    final expectedForecast = NextDaysForecast(map: SplayTreeMap<DateTime, List<NextDayWeather>>());

    blocTest<NextDaysForecastBloc, NextDaysForecastState>(
      'emits [LoadingState, SuccessState] on successful data fetch',
      build: () {
        when(() => mockNextDaysForecastUseCase(any())).thenAnswer((_) async => Right(expectedForecast));
        return nextDaysForecastBloc;
      },
      act: (bloc) => bloc.add(GetNextDaysForecastEvent(city: city)),
      expect: () => [
        LoadingState(),
        SuccessState(nextDaysForecast: expectedForecast),
      ],
      verify: (_) {
        verify(() => mockNextDaysForecastUseCase(city)).called(1);
      },
    );

    blocTest<NextDaysForecastBloc, NextDaysForecastState>(
      'emits [LoadingState, ErrorState] on data fetch failure',
      build: () {
        when(() => mockNextDaysForecastUseCase(any()))
            .thenAnswer((_) async => Left(ServerFailure(message: "Server error")));
        return nextDaysForecastBloc;
      },
      act: (bloc) => bloc.add(GetNextDaysForecastEvent(city: city)),
      expect: () => [
        LoadingState(),
        ErrorState(message: "Server error"),
      ],
      verify: (_) {
        verify(() => mockNextDaysForecastUseCase(city)).called(1);
      },
    );

    blocTest<NextDaysForecastBloc, NextDaysForecastState>(
      'emits [LoadingState, ErrorState] on CacheDataNotFoundFailure',
      build: () {
        when(() => mockNextDaysForecastUseCase(any()))
            .thenAnswer((_) async => Left(CacheDataNotFoundFailure(message: "Cache not found")));
        return nextDaysForecastBloc;
      },
      act: (bloc) => bloc.add(GetNextDaysForecastEvent(city: city)),
      expect: () => [
        LoadingState(),
        ErrorState(message: "Cache not found"),
      ],
      verify: (_) {
        verify(() => mockNextDaysForecastUseCase(city)).called(1);
      },
    );

    blocTest<NextDaysForecastBloc, NextDaysForecastState>(
      'emits [LoadingState, ErrorState] on CacheStorageFailure',
      build: () {
        when(() => mockNextDaysForecastUseCase(any()))
            .thenAnswer((_) async => Left(CacheStorageFailure(message: "Cache storage failure")));
        return nextDaysForecastBloc;
      },
      act: (bloc) => bloc.add(GetNextDaysForecastEvent(city: city)),
      expect: () => [
        LoadingState(),
        ErrorState(message: "Cache storage failure"),
      ],
      verify: (_) {
        verify(() => mockNextDaysForecastUseCase(city)).called(1);
      },
    );

  });
}
