import 'package:weather_app/features/data/models/current_weather_model.dart';
import 'package:weather_app/features/data/models/next_day_weather_model.dart';
import 'package:weather_app/features/domain/entities/current_weather.dart';
import 'package:weather_app/features/domain/entities/next_day_weather.dart';

extension CurrentWeatherModelDataMappers on CurrentWeatherModel {
  CurrentWeather toCurrentWeather() {
    return CurrentWeather(
      temp: main.temp,
      feelsLike: main.feelsLike,
      tempMin: main.tempMin,
      tempMax: main.tempMax,
      pressure: main.pressure,
      seaLevel: main.seaLevel,
      grndLevel: main.grndLevel,
      humidity: main.humidity,
      mainGroupWeather: weather[0].main,
      description: weather[0].description,
      icon: weather[0].icon,
      windSpeed: wind.speed,
      windDeg: wind.deg,
      windGust: wind.gust,
      cloudsAll: clouds.all,
      visibility: visibility,
      sysCountry: sys?.country,
      sysSunrise: _getDateTime(sys?.sunrise),
      sysSunset: _getDateTime(sys?.sunset),
      rainOneHour: rain?.oneHour,
      rainThreeHours: rain?.threeHours,
      snowOneHour: snow?.oneHour,
      snowThreeHours: snow?.threeHours,
      dt: _getDateTime(dt),
    );
  }

  DateTime? _getDateTime(int? unixTimestamp) {
    if(unixTimestamp == null) return null;

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    var r = dateTime;//.toUtc();
    return r;
  }
}

extension NextDayWeatherModelDataMappers on NextDayWeatherModel {
  NextDayWeather toNextDayWeather() {
    return NextDayWeather(
      temp: main.temp,
      feelsLike: main.feelsLike,
      tempMin: main.tempMin,
      tempMax: main.tempMax,
      pressure: main.pressure,
      seaLevel: main.seaLevel,
      grndLevel: main.grndLevel,
      humidity: main.humidity,
      pop: pop,
      mainGroupWeather: weather[0].main,
      description: weather[0].description,
      icon: weather[0].icon,
      windSpeed: wind.speed,
      windDeg: wind.deg,
      windGust: wind.gust,
      cloudsAll: clouds.all,
      visibility: visibility,
      rainThreeHours: rain?.threeHours,
      snowThreeHours: snow?.threeHours,
      dt: _getDateTime(dt),
    );
  }

  DateTime _getDateTime(int unixTimestamp) {

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    var r = dateTime;//.toUtc();
    return r;
  }
}