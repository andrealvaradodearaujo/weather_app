import 'dart:collection';

import 'package:weather_app/features/weather/domain/entities/next_day_weather.dart';

class NextDaysForecast {
  NextDaysForecast( {
    required this.map,
  });
  final SplayTreeMap<DateTime, List<NextDayWeather>> map;

}
