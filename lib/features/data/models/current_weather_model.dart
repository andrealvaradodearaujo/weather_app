import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/data/models/clouds_info_model.dart';
import 'package:weather_app/features/data/models/main_info_model.dart';
import 'package:weather_app/features/data/models/rain_for_current_info_model.dart';
import 'package:weather_app/features/data/models/snow_for_current_info_model.dart';
import 'package:weather_app/features/data/models/sys_info_model.dart';
import 'package:weather_app/features/data/models/weather_info_model.dart';
import 'package:weather_app/features/data/models/weather_model.dart';
import 'package:weather_app/features/data/models/wind_info_model.dart';

part 'current_weather_model.g.dart';

@JsonSerializable()
class CurrentWeatherModel extends WeatherModel {
  CurrentWeatherModel(
    super.main,
    super.weather,
    super.wind,
    super.clouds,
    super.visibility,
    this.rain,
    this.snow,
    this.sys,
    this.dt,
  );
  final RainForCurrentInfoModel? rain;
  final SnowForCurrentInfoModel? snow;
  final SysInfoModel? sys;
  final int? dt;

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherModelFromJson(json);
}
