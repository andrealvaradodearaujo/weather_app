import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/next_days_forecast.dart';
import 'package:weather_app/features/weather/domain/usecases/get_next_days_forecast_use_case.dart';

part 'next_days_forecast_events.dart';
part 'next_days_forecast_states.dart';

/// Part of the 'next_days_forecast_bloc.dart' file, this class represents the state management
/// for fetching and handling the next days' forecast data.
@injectable
class NextDaysForecastBloc extends Bloc<NextDaysForecastEvent, NextDaysForecastState> {
  final GetNextDaysForecastUseCase _getNextDaysForecastUseCase;

  /// Initializes the [NextDaysForecastBloc] with an initial state and required dependencies.
  NextDaysForecastBloc(
    this._getNextDaysForecastUseCase,
  ) : super(InitialState()) {
    on<GetNextDaysForecastEvent>(_onGetNextDaysForecastEvent);
  }

  /// Handles the [GetNextDaysForecastEvent] by triggering the fetching of next days' forecast data.
  Future<void> _onGetNextDaysForecastEvent(
    GetNextDaysForecastEvent event,
    Emitter<NextDaysForecastState> emit,
  ) async {
    emit(LoadingState()); // Emit loading state while fetching data.

    final result = await _getNextDaysForecastUseCase(event.city);

    result.fold(
      (failure) {
        var message = "Something went wrong"; // Default error message.

        // Update the error message based on the specific type of failure.
        if (failure is ServerFailure) {
          message = failure.message;
        } else if (failure is CacheDataNotFoundFailure) {
          message = failure.message;
        } else if (failure is CacheStorageFailure) {
          message = failure.message;
        }

        emit(ErrorState(message: message)); // Emit error state with the error message.
      },
      (nextDaysForecast) =>
          emit(SuccessState(nextDaysForecast: nextDaysForecast)), // Emit success state with fetched data.
    );
  }
}
