import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_info_model.g.dart';

@JsonSerializable()
class WeatherInfoModel extends Equatable {
  const WeatherInfoModel(this.main, this.description, this.icon);
  final String? main;
  final String? description;
  final String? icon;

  Map<String, dynamic> toJson() => _$WeatherInfoModelToJson(this);

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) => _$WeatherInfoModelFromJson(json);

  @override
  List<Object?> get props => [main, description, icon];
}
