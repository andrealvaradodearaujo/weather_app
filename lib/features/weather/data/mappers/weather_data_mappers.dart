import 'package:weather_app/core/resources/dart_extensions/date_extensions.dart';
import 'package:weather_app/features/weather/data/models/current_weather_model.dart';
import 'package:weather_app/features/weather/data/models/next_day_weather_model.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/next_day_weather.dart';

/// Extension on [CurrentWeatherModel] providing mapping functions to convert to corresponding domain entities.
extension CurrentWeatherModelDataMappers on CurrentWeatherModel {
  /// Maps [CurrentWeatherModel] to [CurrentWeather] entity.
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
      iconUrl: 'https://openweathermap.org/img/wn/${weather[0].icon}@2x.png',
      windSpeed: wind.speed,
      windDeg: wind.deg,
      windGust: wind.gust,
      cloudsAll: clouds.all,
      visibility: visibility,
      country: sys?.country,
      sunrise: sys?.sunrise?.getDateTimeFromUnixTimestamp(),
      sunset: sys?.sunset?.getDateTimeFromUnixTimestamp(),
      rainOneHour: rain?.oneHour,
      rainThreeHours: rain?.threeHours,
      snowOneHour: snow?.oneHour,
      snowThreeHours: snow?.threeHours,
      dt: dt?.getDateTimeFromUnixTimestamp(),
      cityName: name,
    );
  }
}

/// Extension on [NextDayWeatherModel] providing mapping functions to convert to corresponding domain entities.
extension NextDayWeatherModelDataMappers on NextDayWeatherModel {
  /// Maps [NextDayWeatherModel] to [NextDayWeather] entity.
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
      iconUrl: 'https://openweathermap.org/img/wn/${weather[0].icon}@2x.png',
      windSpeed: wind.speed,
      windDeg: wind.deg,
      windGust: wind.gust,
      cloudsAll: clouds.all,
      visibility: visibility,
      rainThreeHours: rain?.threeHours,
      snowThreeHours: snow?.threeHours,
      dt: dt.getDateTimeFromUnixTimestamp(),
    );
  }
}