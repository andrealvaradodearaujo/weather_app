import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/resources/settings.dart';
import 'package:weather_app/features/data/models/current_weather_model.dart';
import 'package:weather_app/features/data/models/next_day_weather_model.dart';

/// A remote data source responsible for fetching weather-related data from an external API using Dio.
///
/// This class interacts with the OpenWeatherMap API to retrieve the current weather
/// and the forecast for the next days based on the provided latitude and longitude.
@injectable
class WeatherRemoteDataSource {
  /// Constructs a [WeatherRemoteDataSource] with the provided Dio instance [_dio].
  WeatherRemoteDataSource(this._dio);

  /// An instance of [Dio] used for making HTTP requests to the OpenWeatherMap API.
  final Dio _dio;

  /// Fetches the current weather data from the OpenWeatherMap API for the specified [lat] and [lon].
  ///
  /// Throws a [ServerException] in case of any error during the API request.
  Future<CurrentWeatherModel> getCurrentWeather(double lat, double lon) async {
    try {
      final result = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=${Settings.appid}',
      );
      return CurrentWeatherModel.fromJson(result.data);
    } on Exception catch (_) {
      throw ServerException();
    }
  }

  /// Fetches the forecast for the next days from the OpenWeatherMap API for the specified [lat] and [lon].
  ///
  /// Throws a [ServerException] in case of any error during the API request.
  Future<List<NextDayWeatherModel>> getNextDaysForecast(double lat, double lon) async {
    try {
      final result = await _dio.get(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&appid=${Settings.appid}',
      );
      return NextDayWeatherModel.listFromJson(result.data['list']);
    } on Exception catch (_) {
      throw ServerException();
    }
  }
}
