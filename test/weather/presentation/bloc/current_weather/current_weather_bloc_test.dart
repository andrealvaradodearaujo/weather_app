import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/get_current_weather_use_case.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';

class MockGetCurrentWeatherUseCase extends Mock
    implements GetCurrentWeatherUseCase {}

void main() {
  late CurrentWeatherBloc currentWeatherBloc;
  late MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCase;

  setUp(() {
    mockGetCurrentWeatherUseCase = MockGetCurrentWeatherUseCase();
    currentWeatherBloc =
        CurrentWeatherBloc(mockGetCurrentWeatherUseCase);
  });

  group('CurrentWeatherBloc', () {
    const city = 'TestCity';
    const expectedWeather = CurrentWeather();

    blocTest<CurrentWeatherBloc, CurrentWeatherState>(
      'emits [LoadingState, SuccessState] on successful data fetch',
      build: () {
        when(() => mockGetCurrentWeatherUseCase(any()))
            .thenAnswer((_) async => const Right(expectedWeather));
        return currentWeatherBloc;
      },
      act: (bloc) => bloc.add(GetCurrentWeatherEvent(city: city)),
      expect: () => [
        LoadingState(),
        SuccessState(currentWeather: expectedWeather),
      ],
      verify: (_) {
        verify(() => mockGetCurrentWeatherUseCase(city)).called(1);
      },
    );

    blocTest<CurrentWeatherBloc, CurrentWeatherState>(
      'emits [LoadingState, ErrorState] on data fetch failure',
      build: () {
        when(() => mockGetCurrentWeatherUseCase(any()))
            .thenAnswer((_) async => Left(ServerFailure(message: "Server error")));
        return currentWeatherBloc;
      },
      act: (bloc) => bloc.add(GetCurrentWeatherEvent(city: city)),
      expect: () => [
        LoadingState(),
        ErrorState(message: "Server error"),
      ],
      verify: (_) {
        verify(() => mockGetCurrentWeatherUseCase(city)).called(1);
      },
    );

    blocTest<CurrentWeatherBloc, CurrentWeatherState>(
      'emits [LoadingState, ErrorState] on cache storage failure',
      build: () {
        when(() => mockGetCurrentWeatherUseCase(any()))
            .thenAnswer((_) async => Left(CacheStorageFailure(message: "Cache storage error")));
        return currentWeatherBloc;
      },
      act: (bloc) => bloc.add(GetCurrentWeatherEvent(city: city)),
      expect: () => [
        LoadingState(),
        ErrorState(message: "Cache storage error"),
      ],
      verify: (_) {
        verify(() => mockGetCurrentWeatherUseCase(city)).called(1);
      },
    );
  });

}