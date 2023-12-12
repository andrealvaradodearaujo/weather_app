import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather_app/data/models/clouds_info_model.dart';
import 'package:weather_app/features/weather_app/data/models/main_info_model.dart';
import 'package:weather_app/features/weather_app/data/models/rain_for_next_days_info_model.dart';
import 'package:weather_app/features/weather_app/data/models/snow_for_next_days_info_model.dart';
import 'package:weather_app/features/weather_app/data/models/weather_info_model.dart';
import 'package:weather_app/features/weather_app/data/models/weather_model.dart';
import 'package:weather_app/features/weather_app/data/models/wind_info_model.dart';

part 'next_day_weather_model.g.dart';

@JsonSerializable()
class NextDayWeatherModel extends WeatherModel {
  NextDayWeatherModel(
    super.main,
    super.weather,
    super.wind,
    super.clouds,
    super.visibility,
    this.rain,
    this.snow,
    this.pop,
    this.dt,
  );
  final RainForNextDaysInfoModel? rain;
  final SnowForNextDaysInfoModel? snow;
  final int dt;
  final double? pop;

  Map<String, dynamic> toJson() => _$NextDayWeatherModelToJson(this);

  factory NextDayWeatherModel.fromJson(Map<String, dynamic> json) => _$NextDayWeatherModelFromJson(json);

  static List<NextDayWeatherModel> listFromJson(List<dynamic> json) {
    return json.map((value) => NextDayWeatherModel.fromJson(value)).toList();
  }
}
