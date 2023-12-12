import 'package:json_annotation/json_annotation.dart';

part 'weather_info_model.g.dart';

@JsonSerializable()
class WeatherInfoModel {
  WeatherInfoModel(this.main, this.description, this.icon);
  final String? main;
  final String? description;
  final String? icon;

  Map<String, dynamic> toJson() => _$WeatherInfoModelToJson(this);

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) => _$WeatherInfoModelFromJson(json);
}
