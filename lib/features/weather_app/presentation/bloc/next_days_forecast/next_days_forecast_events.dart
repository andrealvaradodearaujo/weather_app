/// This file defines the events related to the [NextDaysForecastBloc].
part of 'next_days_forecast_bloc.dart';

/// An abstract class representing events that can be triggered in the [NextDaysForecastBloc].
@immutable
abstract class NextDaysForecastEvent {}

/// A specific event that signals the request to fetch the next days' forecast for a given city.
class GetNextDaysForecastEvent extends NextDaysForecastEvent {
  final String city;

  /// Constructs a [GetNextDaysForecastEvent] with the specified [city] parameter.
  GetNextDaysForecastEvent({required this.city});
}