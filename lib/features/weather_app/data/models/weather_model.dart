import 'package:weather_app/features/weather_app/data/models/clouds_info_model.dart';
import 'package:weather_app/features/weather_app/data/models/main_info_model.dart';
import 'package:weather_app/features/weather_app/data/models/weather_info_model.dart';
import 'package:weather_app/features/weather_app/data/models/wind_info_model.dart';

abstract class WeatherModel {
  WeatherModel(
    this.main,
    this.weather,
    this.wind,
    this.clouds,
    this.visibility,
  );
  final MainInfoModel main;
  final List<WeatherInfoModel> weather;
  final WindInfoModel wind;
  final CloudsInfoModel clouds;
  final double? visibility;

}
