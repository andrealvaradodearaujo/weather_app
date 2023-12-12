import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/resources/dart_extensions/date_extensions.dart';
import 'package:weather_app/features/data/models/current_weather_model.dart';
import 'package:weather_app/features/data/models/next_day_weather_model.dart';

/// A local data source responsible for caching weather-related data using shared preferences.
///
/// This class interacts with the device's shared preferences to store and retrieve
/// information related to the current weather and the forecast for the next days.
@injectable
class WeatherLocalDataSource {
  /// Constructs a [WeatherLocalDataSource] with the provided [sharedPreferences].
  ///
  /// The [sharedPreferences] is used for interacting with the local storage.
  WeatherLocalDataSource(this.sharedPreferences);

  /// An instance of [SharedPreferences] used for interacting with the local storage.
  final SharedPreferences sharedPreferences;

  /// Key for caching the current weather data in shared preferences.
  static const String _currentWeatherKey = 'current_weather';

  /// Key for caching the next days forecast data in shared preferences.
  static const String _nextDaysForecastKey = 'next_days_forecast';

  /// Builds the key for caching the current weather based on the provided [lat], [lon], and [dateTime].
  String _buildCurrentWeatherKey(double lat, double lon, DateTime dateTime) {
    return "$_currentWeatherKey-lat:$lat-lon:$lon-day:${dateTime.formatDay()}";
  }

  /// Caches the provided [CurrentWeatherModel] for a specific [lat], [lon], and [dateTime].
  ///
  /// Throws a [CacheCurrentWeatherException] if an error occurs while saving the data.
  Future<void> cacheCurrentWeatherModel(double lat, double lon, DateTime dateTime, CurrentWeatherModel cwm) async {
    try {
      final encodedCurrentWeather = jsonEncode(cwm);
      final key = _buildCurrentWeatherKey(lat, lon, dateTime);
      await sharedPreferences.setString(key, encodedCurrentWeather);
    } on Exception catch (_) {
      throw CacheCurrentWeatherException(); // Error while saving current weather data
    }
  }

  /// Retrieves the cached [CurrentWeatherModel] for a specific [lat], [lon], and [dateTime].
  ///
  /// Throws a [CacheDataNotFoundException] if the data is not found in the cache,
  /// and a [CacheStorageException] for other unexpected errors.
  Future<CurrentWeatherModel> getCurrentWeather(double lat, double lon, DateTime dateTime) async {
    try {
      final key = _buildCurrentWeatherKey(lat, lon, dateTime);
      final encodedCurrentWeather = sharedPreferences.getString(key);
      if (encodedCurrentWeather != null) {
        return CurrentWeatherModel.fromJson(jsonDecode(encodedCurrentWeather));
      }
      throw CacheDataNotFoundException(); // Current weather data not found in cache
    } on CacheDataNotFoundException catch (_) {
      rethrow;
    } catch (_) {
      throw CacheStorageException(); // Error while getting current weather data from local storage
    }
  }

  /// Builds the key for caching the next day weather model list based on the provided [lat], [lon], and [dateTime].
  String _buildNextDaysForecastKey(double lat, double lon, DateTime dateTime) {
    return "$_nextDaysForecastKey-lat:$lat-lon:$lon-day:${dateTime.formatDay()}";
  }

  /// Caches the provided list of [NextDayWeatherModel] for a specific [lat], [lon], and [dateTime].
  ///
  /// Throws a [CacheNextDayWeatherModelListException] if an error occurs while saving the data.
  Future<void> cacheNextDayWeatherModelList(
      double lat, double lon, DateTime dateTime, List<NextDayWeatherModel> list) async {
    try {
      final encodedNextDayWeatherModel = jsonEncode(list);
      final key = _buildNextDaysForecastKey(lat, lon, dateTime);
      await sharedPreferences.setString(key, encodedNextDayWeatherModel);
    } on Exception catch (_) {
      throw CacheNextDayWeatherModelListException(); // Error while saving next day weather model list data
    }
  }

  /// Retrieves the cached list of [NextDayWeatherModel] for a specific [lat], [lon], and [dateTime].
  ///
  /// Throws a [CacheStorageException] for unexpected errors while retrieving the data.
  Future<List<NextDayWeatherModel>> getNextDayWeatherModelList(double lat, double lon, DateTime dateTime) async {
    try {
      final key = _buildNextDaysForecastKey(lat, lon, dateTime);
      final encodedNextDayWeatherModel = sharedPreferences.getString(key);
      if (encodedNextDayWeatherModel != null) {
        return NextDayWeatherModel.listFromJson(jsonDecode(encodedNextDayWeatherModel));
      }
      return [];
    } catch (_) {
      throw CacheStorageException(); // Error while getting next day weather model list data from local storage
    }
  }
}
