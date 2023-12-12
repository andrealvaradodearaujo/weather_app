import 'package:json_annotation/json_annotation.dart';

part 'rain_for_current_info_model.g.dart';

@JsonSerializable()
class RainForCurrentInfoModel {
  RainForCurrentInfoModel(this.oneHour, this.threeHours);
  @JsonKey(name: '1h')
  final double? oneHour;
  @JsonKey(name: '3h')
  final double? threeHours;

  Map<String, dynamic> toJson() => _$RainForCurrentInfoModelToJson(this);

  factory RainForCurrentInfoModel.fromJson(Map<String, dynamic> json) => _$RainForCurrentInfoModelFromJson(json);
}
