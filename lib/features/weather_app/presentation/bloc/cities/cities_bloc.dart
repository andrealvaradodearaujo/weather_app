import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/core/resources/dart_extensions/string_extensions.dart';
import 'package:weather_app/features/weather_app/domain/usecases/get_cities_use_case.dart';

part 'cities_events.dart';
part 'cities_states.dart';

/// Business Logic Component (BLoC) responsible for managing the state related to cities in the application.
@injectable
class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {

  /// Constructs the [CitiesBloc] with the specified [GetCitiesUseCase].
  ///
  /// [_getCitiesUseCase] Use case for retrieving the list of available cities.
  CitiesBloc(this._getCitiesUseCase) : super(InitialState()) {
    on<SearchCityEvent>(_onSearchCity);
    on<InitializeEvent>(_onInitialize);
  }

  final GetCitiesUseCase _getCitiesUseCase;

  /// Handles the [SearchCityEvent] by filtering the list of cities based on the search query.
  ///
  /// [event] The event containing the search query and the list of all cities.
  /// [emit] The function to emit the new state.
  Future<void> _onSearchCity(SearchCityEvent event, Emitter<CitiesState> emit) async {
    // Normalize the query and filter the cities accordingly.
    final normalizedQuery = event.city.toLowerCase().normalize();
    final filteredCities = event.cities
        .where((city) => city.toLowerCase().normalize().contains(normalizedQuery))
        .toList();

    // Emit the updated state with the filtered cities.
    emit(CitiesLoadedState(allCities: event.cities, filteredCities: filteredCities));
  }

  /// Handles the [InitializeEvent] by retrieving and initializing the list of cities.
  ///
  /// [event] The initialization event.
  /// [emit] The function to emit the new state.
  Future<void> _onInitialize(InitializeEvent event, Emitter<CitiesState> emit) async {
    // Retrieve the list of cities using the GetCitiesUseCase.
    final cities = _getCitiesUseCase();

    // Emit the initial state with the full list of cities.
    emit(CitiesLoadedState(allCities: cities, filteredCities: cities));
  }
}