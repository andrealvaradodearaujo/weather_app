import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/features/domain/entities/current_weather.dart';
import 'package:weather_app/features/domain/usecases/get_current_weather_use_case.dart';

part 'current_weather_events.dart';
part 'current_weather_states.dart';

@injectable
class CurrentWeatherBloc extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  CurrentWeatherBloc(
    this._getCurrentWeatherUseCase,
  ) : super(InitialState()) {
    on<GetCurrentWeatherEvent>(_onGetCurrentWeatherEvent);
  }

  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  Future<void> _onGetCurrentWeatherEvent(
    GetCurrentWeatherEvent event,
    Emitter<CurrentWeatherState> emit,
  ) async {
    emit(LoadingState());
    final cities = await _getCurrentWeatherUseCase(event.city);
    cities.fold(
      (_) => emit(ErrorState()),
      (currentWeather) => emit(SuccessState(currentWeather: currentWeather)),
    );
  }
}
