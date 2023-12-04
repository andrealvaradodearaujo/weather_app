part of 'cities_bloc.dart';

@immutable
abstract class CitiesEvent {}

class SearchCityEvent extends CitiesEvent {
  final String city;
  final List<String> cities;

  SearchCityEvent({required this.cities, required this.city});
}

class InitializeEvent extends CitiesEvent {}
