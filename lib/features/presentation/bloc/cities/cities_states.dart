part of 'cities_bloc.dart';

@immutable
abstract class CitiesState {}

class InitialState extends CitiesState {}

class CitiesLoadedState extends CitiesState {
  final List<String> allCities;
  final List<String> filteredCities;

  CitiesLoadedState({required this.allCities, required this.filteredCities});
}
