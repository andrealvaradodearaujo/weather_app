import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/core/resources/dart_extensions/string_extensions.dart';
import 'package:weather_app/features/domain/usecases/get_cities_use_case.dart';

part 'cities_events.dart';
part 'cities_states.dart';

@injectable
class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc(
    this._getCitiesUseCase,
  ) : super(InitialState()) {
    on<SearchCityEvent>(_onSearchCity);
    on<InitializeEvent>(_onInitialize);
  }

  final GetCitiesUseCase _getCitiesUseCase;

  Future<void> _onSearchCity(
    SearchCityEvent event,
    Emitter<CitiesState> emit,
  ) async {
    final normalizedQuery = event.city.toLowerCase().normalize();
    final filteredCities =
        event.cities.where((city) => city.toLowerCase().normalize().contains(normalizedQuery)).toList();
    emit(CitiesLoadedState(allCities: event.cities, filteredCities: filteredCities));
  }

  Future<void> _onInitialize(
    InitializeEvent event,
    Emitter<CitiesState> emit,
  ) async {
    final cities = _getCitiesUseCase();
    emit(CitiesLoadedState(allCities: cities, filteredCities: cities));
  }
}
