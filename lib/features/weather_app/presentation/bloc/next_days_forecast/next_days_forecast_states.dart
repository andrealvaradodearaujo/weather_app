/// This file defines the states related to the [NextDaysForecastBloc].
part of 'next_days_forecast_bloc.dart';

/// An abstract class representing states that the [NextDaysForecastBloc] can be in.
@immutable
abstract class NextDaysForecastState {}

/// A state indicating that the [NextDaysForecastBloc] is currently in a loading state,
/// typically while fetching data or performing an asynchronous operation.
class LoadingState extends NextDaysForecastState {}

/// A state representing the initial state of the [NextDaysForecastBloc].
class InitialState extends NextDaysForecastState {}

/// A state indicating that the [NextDaysForecastBloc] has successfully fetched and loaded
/// the next days' forecast data.
class SuccessState extends NextDaysForecastState {
  final NextDaysForecast nextDaysForecast;

  /// Constructs a [SuccessState] with the provided [nextDaysForecast] data.
  SuccessState({required this.nextDaysForecast});
}

/// A state indicating that an error has occurred during the operation of the [NextDaysForecastBloc].
class ErrorState extends NextDaysForecastState {
  final String message;

  /// Constructs an [ErrorState] with the specified error [message].
  ErrorState({required this.message});
}
