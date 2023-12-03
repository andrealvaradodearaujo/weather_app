part of 'cities_bloc.dart';

@immutable
abstract class CitiesEvent {
  final List<String> cities;

  const CitiesEvent({required this.cities});
}

class SearchCityEvent extends CitiesEvent {
  final String city;

  const SearchCityEvent({required super.cities, required this.city});
}

class InitializeEvent extends CitiesEvent {
  const InitializeEvent({required super.cities});
}
