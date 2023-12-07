part of 'next_days_forecast_bloc.dart';

@immutable
abstract class NextDaysForecastEvent {}

class GetNextDaysForecastEvent extends NextDaysForecastEvent {
  final String city;

  GetNextDaysForecastEvent({required this.city});
}

