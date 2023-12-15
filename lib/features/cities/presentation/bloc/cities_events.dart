/// Part of the [CitiesBloc] file, this section defines the events that can trigger state changes in the [CitiesBloc].
part of 'cities_bloc.dart';

/// Base class for events related to the cities functionality.
@immutable
abstract class CitiesEvent extends Equatable {}

/// Event triggered when the user searches for a city.
///
/// [city] The search query entered by the user.
/// [cities] The list of all available cities.
class SearchCityEvent extends CitiesEvent {
  final String city;
  final List<String> cities;

  /// Constructs a [SearchCityEvent] with the specified [city] and [cities].
  SearchCityEvent({required this.cities, required this.city});

  @override
  List<Object?> get props => [city, cities];
}

/// Event triggered when the cities functionality is initialized.
class InitializeEvent extends CitiesEvent {
  @override
  List<Object?> get props => [];
}

