import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/features/domain/entities/next_days_forecast.dart';
import 'package:weather_app/features/domain/usecases/get_next_days_forecast_use_case.dart';

part 'next_days_forecast_events.dart';
part 'next_days_forecast_states.dart';

@injectable
class NextDaysForecastBloc extends Bloc<NextDaysForecastEvent, NextDaysForecastState> {
  NextDaysForecastBloc(
    this._getNextDaysForecastUseCase,
  ) : super(InitialState()) {
    on<GetNextDaysForecastEvent>(_onGetNextDaysForecastEvent);
  }

  final GetNextDaysForecastUseCase _getNextDaysForecastUseCase;

  Future<void> _onGetNextDaysForecastEvent(
    GetNextDaysForecastEvent event,
    Emitter<NextDaysForecastState> emit,
  ) async {
    emit(LoadingState());
    final result = await _getNextDaysForecastUseCase(event.city);
    result.fold(
      (_) => emit(ErrorState()),
      (nextDaysForecast) => emit(SuccessState(nextDaysForecast: nextDaysForecast)),
    );
  }
}
