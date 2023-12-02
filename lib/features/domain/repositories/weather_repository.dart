import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/domain/entities/current_weather.dart';
import 'package:weather_app/features/domain/entities/next_days_forecast.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(double lat, double lon);
  Future<Either<Failure, NextDaysForecast>> getNextDaysForecast(double lat, double lon);
}
