part of 'next_days_forecast_bloc.dart';

@immutable
abstract class NextDaysForecastState {}

class LoadingState extends NextDaysForecastState {}

class InitialState extends NextDaysForecastState {}

class SuccessState extends NextDaysForecastState {
  final NextDaysForecast nextDaysForecast;

  SuccessState({required this.nextDaysForecast});
}

class ErrorState extends NextDaysForecastState {}