/// This file defines the [CurrentWeatherEvent] classes used in the [CurrentWeatherBloc].
part of 'current_weather_bloc.dart';

/// The base abstract class for events related to the current weather.
@immutable
abstract class CurrentWeatherEvent extends Equatable {}

/// Event triggered to fetch the current weather for a specific city.
///
/// [city] The name of the city for which the current weather is to be fetched.
class GetCurrentWeatherEvent extends CurrentWeatherEvent {
  /// The name of the city for which the current weather is to be fetched.
  final String city;

  /// Constructs a [GetCurrentWeatherEvent] with the specified [city].
  GetCurrentWeatherEvent({required this.city});

  @override
  List<Object?> get props => [city];
}