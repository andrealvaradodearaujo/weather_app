import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/exception.dart';
import 'package:weather_app/core/resources/settings.dart';
import 'package:weather_app/features/data/models/current_weather_model.dart';
import 'package:weather_app/features/data/models/next_day_weather_model.dart';

@injectable
class WeatherRemoteDataSource {
  WeatherRemoteDataSource(this._dio);

  final Dio _dio;

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
