import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/cities/domain/usecases/get_cities_use_case.dart';
import 'package:weather_app/features/cities/presentation/bloc/cities_bloc.dart';

class MockGetCitiesUseCase extends Mock implements GetCitiesUseCase {}

void main() {
  late CitiesBloc citiesBloc;
  late MockGetCitiesUseCase mockGetCitiesUseCase;

  setUp(() {
    mockGetCitiesUseCase = MockGetCitiesUseCase();
    citiesBloc = CitiesBloc(mockGetCitiesUseCase);
  });

  tearDown(() {
    citiesBloc.close();
  });

  group('CitiesBloc', () {
    const cities = [
      Strings.citySaoPauloBrazil,
      Strings.cityMelbourneAustralia,
      Strings.cityMonteCarloMonaco,
      Strings.citySilverstoneUK
    ];
    const searchQuery = 'Sao';

    blocTest<CitiesBloc, CitiesState>(
      'emits [CitiesLoadedState] when initialized',
      build: () {
        when(() => mockGetCitiesUseCase()).thenAnswer((_) => cities);
        return citiesBloc;
      },
      act: (bloc) => bloc.add(InitializeEvent()),
      expect: () => [
        CitiesLoadedState(allCities: cities, filteredCities: cities),
      ],
      verify: (_) {
        verify(() => mockGetCitiesUseCase()).called(1);
      },
    );

    blocTest<CitiesBloc, CitiesState>(
      'emits [CitiesLoadedState] when searching for a city',
      build: () {
        when(() => mockGetCitiesUseCase()).thenReturn(cities);
        return citiesBloc;
      },
      act: (bloc) => bloc.add(SearchCityEvent(cities: cities, city: searchQuery)),
      expect: () => [
        CitiesLoadedState(allCities: cities, filteredCities: const [Strings.citySaoPauloBrazil]),
      ],
      verify: (_) {
        verifyNever(() => mockGetCitiesUseCase());
      },
    );

    blocTest<CitiesBloc, CitiesState>(
      'emits [CitiesLoadedState] when searching for a city with a different query',
      build: () {
        when(() => mockGetCitiesUseCase()).thenReturn(cities);
        return citiesBloc;
      },
      act: (bloc) => bloc.add(SearchCityEvent(cities: cities, city: 'AnotherCity')),
      expect: () => [
        CitiesLoadedState(allCities: cities, filteredCities: []),
      ],
      verify: (_) {
        verifyNever(() => mockGetCitiesUseCase());
      },
    );
  });
}
