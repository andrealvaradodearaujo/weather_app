import 'dart:async';
import 'dart:collection';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/features/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/data/mappers/weather_data_mappers.dart';
import 'package:weather_app/features/domain/entities/current_weather.dart';
import 'package:weather_app/features/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/domain/entities/next_days_forecast.dart';
import 'package:weather_app/features/domain/repositories/weather_repository.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(this._weatherRemoteDataSource);

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  @override
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(double lat, double lon) async{
    try {
      final currentWeatherModel = await _weatherRemoteDataSource.getCurrentWeather(lat, lon);
      return Right(currentWeatherModel.toCurrentWeather());
    } on Exception catch (_) {
      return Left(GenericFailure());
    }
  }

  @override
  Future<Either<Failure, NextDaysForecast>> getNextDaysForecast(double lat, double lon) async{
    try {
      final nextDayWeatherModelList = await _weatherRemoteDataSource.getNextDaysForecast(lat, lon);
      List<NextDayWeather> nextDayWeatherList = nextDayWeatherModelList.map((member) => member.toNextDayWeather()).toList();

      var map = SplayTreeMap<DateTime, List<NextDayWeather>>();

      for (var ndw in nextDayWeatherList) {
        var key = DateTime(ndw.dt.year, ndw.dt.month, ndw.dt.day);

        map.putIfAbsent(key, () => []);
        map[key]!.add(ndw);
      }

      map.forEach((key, value) {
        value.sort((a, b) => a.dt.compareTo(b.dt));
      });

      return Right(NextDaysForecast(map: map));
    } on Exception catch (_) {
      return Left(GenericFailure());
    }
  }
}
