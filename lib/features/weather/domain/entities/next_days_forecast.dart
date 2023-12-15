import 'package:equatable/equatable.dart';
import 'dart:collection';
import 'package:weather_app/features/weather/domain/entities/next_day_weather.dart';

class NextDaysForecast extends Equatable {
  const NextDaysForecast({
    required this.map,
  });

  final SplayTreeMap<DateTime, List<NextDayWeather>> map;

  @override
  List<Object?> get props => [map];
}