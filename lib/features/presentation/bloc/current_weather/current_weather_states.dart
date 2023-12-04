part of 'current_weather_bloc.dart';

@immutable
abstract class CurrentWeatherState {}

class LoadingState extends CurrentWeatherState {}

class InitialState extends CurrentWeatherState {}

class SuccessState extends CurrentWeatherState {
  final CurrentWeather currentWeather;

  SuccessState({required this.currentWeather});
}

class ErrorState extends CurrentWeatherState {}