/// This file defines the [CurrentWeatherState] classes used in the [CurrentWeatherBloc].
part of 'current_weather_bloc.dart';

/// The base abstract class for states related to the current weather.
@immutable
abstract class CurrentWeatherState {}

/// Represents the loading state when the current weather data is being fetched.
class LoadingState extends CurrentWeatherState {}

/// Represents the initial state before any operations are performed.
class InitialState extends CurrentWeatherState {}

/// Represents the successful state after fetching the current weather data.
///
/// [currentWeather] The current weather data for the specified city.
class SuccessState extends CurrentWeatherState {
  /// The current weather data for the specified city.
  final CurrentWeather currentWeather;

  /// Constructs a [SuccessState] with the specified [currentWeather].
  SuccessState({required this.currentWeather});
}

/// Represents the error state when an error occurs while fetching the current weather data.
///
/// [message] The error message describing the issue.
class ErrorState extends CurrentWeatherState {
  /// The error message describing the issue.
  final String message;

  /// Constructs an [ErrorState] with the specified [message].
  ErrorState({required this.message});
}