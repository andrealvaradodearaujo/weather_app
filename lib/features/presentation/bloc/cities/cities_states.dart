/// Part of the [CitiesBloc] file, this section defines the states that the [CitiesBloc] can be in.
part of 'cities_bloc.dart';

/// Base class for states related to the cities functionality.
@immutable
abstract class CitiesState {}

/// Initial state of the [CitiesBloc], representing the state before any events are processed.
class InitialState extends CitiesState {}

/// State indicating that cities have been loaded, providing information about all cities and the currently filtered cities.
///
/// [allCities] The complete list of available cities.
/// [filteredCities] The subset of cities that match the search criteria.
class CitiesLoadedState extends CitiesState {
  final List<String> allCities;
  final List<String> filteredCities;

  /// Constructs a [CitiesLoadedState] with the specified [allCities] and [filteredCities].
  CitiesLoadedState({required this.allCities, required this.filteredCities});
}