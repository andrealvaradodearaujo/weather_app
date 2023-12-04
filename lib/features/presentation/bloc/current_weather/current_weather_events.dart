part of 'current_weather_bloc.dart';

@immutable
abstract class CurrentWeatherEvent {}

class GetCurrentWeatherEvent extends CurrentWeatherEvent {
  final String city;

  GetCurrentWeatherEvent({required this.city});
}

