import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/data/models/clouds_info_model.dart';
import 'package:weather_app/features/weather/data/models/main_info_model.dart';
import 'package:weather_app/features/weather/data/models/rain_for_current_info_model.dart';
import 'package:weather_app/features/weather/data/models/snow_for_current_info_model.dart';
import 'package:weather_app/features/weather/data/models/sys_info_model.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/data/models/weather_info_model.dart';
import 'package:weather_app/features/weather/data/models/wind_info_model.dart';


part 'current_weather_model.g.dart';

@JsonSerializable()
class CurrentWeatherModel extends WeatherModel with EquatableMixin{
  const CurrentWeatherModel(
    super.main,
    super.weather,
    super.wind,
    super.clouds,
    super.visibility,
    this.rain,
    this.snow,
    this.sys,
    this.dt,
    this.name,
  );
  final RainForCurrentInfoModel? rain;
  final SnowForCurrentInfoModel? snow;
  final SysInfoModel? sys;
  final int? dt;
  final String? name;

  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherModelFromJson(json);

  @override
  List<Object?> get props {
    return [
      super.main,
      super.weather,
      super.wind,
      super.clouds,
      super.visibility,
      rain,
      snow,
      sys,
      dt,
      name,
    ];
  }
}
