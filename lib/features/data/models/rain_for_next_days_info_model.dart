import 'package:json_annotation/json_annotation.dart';

part 'rain_for_next_days_info_model.g.dart';

@JsonSerializable()
class RainForNextDaysInfoModel {
  RainForNextDaysInfoModel(this.threeHours);
  @JsonKey(name: '3h')
  final double? threeHours;

  Map<String, dynamic> toJson() => _$RainForNextDaysInfoModelToJson(this);

  factory RainForNextDaysInfoModel.fromJson(Map<String, dynamic> json) => _$RainForNextDaysInfoModelFromJson(json);
}
