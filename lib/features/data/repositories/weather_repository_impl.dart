import 'dart:async';
import 'dart:collection';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/core/utils/internet_connection_checker.dart';
import 'package:weather_app/features/data/datasources/weather_local_data_source.dart';
import 'package:weather_app/features/data/models/current_weather_model.dart';
import 'package:weather_app/features/data/models/next_day_weather_model.dart';
import 'package:weather_app/features/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/features/data/mappers/weather_data_mappers.dart';
import 'package:weather_app/features/domain/entities/current_weather.dart';
import 'package:weather_app/features/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/domain/entities/next_days_forecast.dart';
import 'package:weather_app/features/domain/repositories/weather_repository.dart';

/// Repository responsible for providing data related to weather, implementing the WeatherRepository interface.
@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(
    this._weatherRemoteDataSource,
    this._weatherLocalDataSource,
  );

  final WeatherRemoteDataSource _weatherRemoteDataSource;
  final WeatherLocalDataSource _weatherLocalDataSource;

  /// Gets the current weather for the given [lat] and [lon] coordinates.
  ///
  /// If there is an internet connection, it tries to fetch data from the remote source,
  /// caches it locally, and returns the current weather.
  /// If there is no internet connection, it tries to fetch data from the local source.
  @override
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(double lat, double lon) async {
    if (await InternetConnectionChecker.isInternetAvailable()) {
      return await _getCurrentWeatherWithInternet(lat, lon);
    }
    return await _getCurrentWeatherWithNoInternet(lat, lon);
  }

  /// Gets the current weather when there is an internet connection.
  Future<Either<Failure, CurrentWeather>> _getCurrentWeatherWithInternet(double lat, double lon) async {
    try {
      final currentWeatherModel = await _weatherRemoteDataSource.getCurrentWeather(lat, lon);

      await _tryCacheCurrentWeatherModel(lat, lon, DateTime.now(), currentWeatherModel);

      return Right(currentWeatherModel.toCurrentWeather());
    } on ServerException catch (_) {
      return Left(ServerFailure(message: "Server error while getting current weather"));
    }
  }

  /// Gets the current weather when there is no internet connection.
  Future<Either<Failure, CurrentWeather>> _getCurrentWeatherWithNoInternet(double lat, double lon) async {
    try {
      final currentWeatherModel = await _weatherLocalDataSource.getCurrentWeather(lat, lon, DateTime.now());
      return Right(currentWeatherModel.toCurrentWeather());
    } on CacheDataNotFoundException catch (_) {
      return Left(
        CacheDataNotFoundFailure(
          message: "There is no internet connection and you have no current weather previously stored locally",
        ),
      );
    } on CacheStorageException catch (_) {
      return Left(
        CacheStorageFailure(
          message:
              "There is no internet connection and there was an unexpected error while getting current weather data from local storage",
        ),
      );
    }
  }

  /// Tries to cache the current weather model locally.
  Future<void> _tryCacheCurrentWeatherModel(double lat, double lon, DateTime dateTime, CurrentWeatherModel cwm) async {
    try {
      await _weatherLocalDataSource.cacheCurrentWeatherModel(lat, lon, dateTime, cwm);
    } on CacheCurrentWeatherException catch (_) {
      GetIt.I.get<Logger>().e('Error caching current weather locally');
    }
  }

  /// Retrieves the next days forecast for a given location.
  ///
  /// If an internet connection is available, it fetches the forecast from the remote data source.
  /// Otherwise, it attempts to retrieve the forecast from the local data source.
  ///
  /// Returns a [Right] containing the [NextDaysForecast] if successful,
  /// or a [Left] containing a [Failure] if an error occurs.
  @override
  Future<Either<Failure, NextDaysForecast>> getNextDaysForecast(double lat, double lon) async {
    if (await InternetConnectionChecker.isInternetAvailable()) {
      return await _getNextDaysForecastWithInternet(lat, lon);
    }
    return await _getNextDaysForecastWithNoInternet(lat, lon);
  }

  /// Fetches the next days forecast from the remote data source.
  ///
  /// Converts the retrieved [NextDayWeatherModel] list into a sorted map
  /// and caches the data locally. Returns a [Right] containing the [NextDaysForecast]
  /// if successful, or a [Left] containing a [ServerFailure] if a server error occurs.
  Future<Either<Failure, NextDaysForecast>> _getNextDaysForecastWithInternet(double lat, double lon) async {
    try {
      final nextDayWeatherModelList = await _weatherRemoteDataSource.getNextDaysForecast(lat, lon);

      var ndwModelMap = SplayTreeMap<DateTime, List<NextDayWeatherModel>>();

      for (var ndwModel in nextDayWeatherModelList) {
        final ndwDateTime = DateTime.fromMillisecondsSinceEpoch(ndwModel.dt * 1000);

        var key = DateTime(ndwDateTime.year, ndwDateTime.month, ndwDateTime.day);

        ndwModelMap.putIfAbsent(key, () => []);
        ndwModelMap[key]!.add(ndwModel);
      }

      ndwModelMap.forEach((key, value) {
        value.sort((a, b) => a.dt.compareTo(b.dt));
      });

      ndwModelMap.forEach((datetime, ndwModelList) async {
        await _tryCacheNextDayWeatherModelList(lat, lon, datetime, ndwModelList);
      });

      var ndwMap = SplayTreeMap<DateTime, List<NextDayWeather>>.from(
        ndwModelMap.map(
          (date, weatherList) => MapEntry(
            date,
            weatherList.map((weatherModel) => weatherModel.toNextDayWeather()).toList(),
          ),
        ),
      );

      return Right(NextDaysForecast(map: ndwMap));
    } on ServerException catch (_) {
      return Left(ServerFailure(message: "Server error while getting next days forecast"));
    }
  }

  /// Attempts to fetch the next days forecast from the local data source.
  ///
  /// Retrieves the data for the next 5 days from the local storage and returns a [Right]
  /// containing the [NextDaysForecast] if successful, or a [Left] containing a [CacheDataNotFoundFailure]
  /// if the data is not found locally, or a [Left] containing a [CacheStorageFailure] if an unexpected error occurs.
  Future<Either<Failure, NextDaysForecast>> _getNextDaysForecastWithNoInternet(double lat, double lon) async {
    try {
      var ndwModelMap = SplayTreeMap<DateTime, List<NextDayWeather>>();
      const days = 5;
      var currentDate = DateTime.now();
      int currentDay = 1;
      List<NextDayWeatherModel>? list = await _weatherLocalDataSource.getNextDayWeatherModelList(lat, lon, currentDate);
      if (list.isEmpty) {
        return Left(CacheDataNotFoundFailure(
            message: "There is no internet connection and you have no next days forecast previously stored locally"));
      }

      while (currentDay <= days && list != null) {
        List<NextDayWeather> nextDayWeatherList = list.map((member) => member.toNextDayWeather()).toList();
        var key = DateTime(currentDate.year, currentDate.month, currentDate.day);
        ndwModelMap[key] = nextDayWeatherList;
        currentDate = currentDate.add(const Duration(days: 1));
        list = await _weatherLocalDataSource.getNextDayWeatherModelList(lat, lon, currentDate);
        currentDay++;
      }

      return Right(NextDaysForecast(map: ndwModelMap));
    } on CacheStorageException catch (_) {
      return Left(
        CacheStorageFailure(
          message:
              "There is no internet connection and there was an unexpected error while getting current weather data from local storage",
        ),
      );
    }
  }

  /// Attempts to cache the next day weather model list locally.
  ///
  /// Caches the list of [NextDayWeatherModel] for a specific location and date.
  /// Logs an error if caching fails.
  Future<void> _tryCacheNextDayWeatherModelList(
      double lat, double lon, DateTime dateTime, List<NextDayWeatherModel> ndwModelList) async {
    try {
      await _weatherLocalDataSource.cacheNextDayWeatherModelList(lat, lon, dateTime, ndwModelList);
    } on CacheCurrentWeatherException catch (_) {
      GetIt.I.get<Logger>().e('Error caching current weather locally');
    }
  }

  /// Retrieves a list of city names.
  @override
  List<String> getCities() {
    return [
      Strings.citySilverstoneUK,
      Strings.citySaoPauloBrazil,
      Strings.cityMelbourneAustralia,
      Strings.cityMonteCarloMonaco
    ];
  }
}
