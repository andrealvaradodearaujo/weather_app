import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/get_current_weather_use_case.dart';

part 'current_weather_events.dart';
part 'current_weather_states.dart';

/// The [CurrentWeatherBloc] manages the state related to the current weather.
@injectable
class CurrentWeatherBloc extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  /// Constructor for the [CurrentWeatherBloc].
  ///
  /// [_getCurrentWeatherUseCase] The use case responsible for fetching current weather data.
  CurrentWeatherBloc(
      this._getCurrentWeatherUseCase,
      ) : super(InitialState()) {
    on<GetCurrentWeatherEvent>(_onGetCurrentWeatherEvent);
  }

  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  /// Handles the [GetCurrentWeatherEvent] by initiating the current weather retrieval process.
  ///
  /// [event] The event triggering the current weather retrieval.
  /// [emit] The function to emit new states.
  Future<void> _onGetCurrentWeatherEvent(
      GetCurrentWeatherEvent event,
      Emitter<CurrentWeatherState> emit,
      ) async {
    emit(LoadingState());
    final cities = await _getCurrentWeatherUseCase(event.city);
    cities.fold(
          (failure){
        var message = "Something went wrong";
        if(failure is ServerFailure){
          message = failure.message;
        } else if (failure is CacheDataNotFoundFailure){
          message = failure.message;
        } else if (failure is CacheStorageFailure) {
          message = failure.message;
        }
        emit(ErrorState(message: message));
      },
          (currentWeather) => emit(SuccessState(currentWeather: currentWeather)),
    );
  }
}
