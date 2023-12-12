import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/weather_app/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather_app/domain/entities/next_days_forecast.dart';

/// Repository responsible for defining the contract for accessing weather-related data.
abstract class WeatherRepository {

  /// Retrieves the current weather information for the specified location.
  ///
  /// [lat] Latitude of the location.
  /// [lon] Longitude of the location.
  /// Returns a [Either] containing a [Failure] in case of error or a [CurrentWeather] entity.
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(double lat, double lon);

  /// Retrieves the next days' forecast for the specified location.
  ///
  /// [lat] Latitude of the location.
  /// [lon] Longitude of the location.
  /// Returns a [Either] containing a [Failure] in case of error or a [NextDaysForecast] entity.
  Future<Either<Failure, NextDaysForecast>> getNextDaysForecast(double lat, double lon);

  /// Returns a list of cities for which weather information is available.
  ///
  /// This method is useful for providing a predefined list of cities for user selection.
  List<String> getCities();
}
