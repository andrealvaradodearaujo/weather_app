import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rain_for_next_days_info_model.g.dart';

@JsonSerializable()
class RainForNextDaysInfoModel extends Equatable{
  const RainForNextDaysInfoModel(this.threeHours);
  @JsonKey(name: '3h')
  final double? threeHours;

  Map<String, dynamic> toJson() => _$RainForNextDaysInfoModelToJson(this);

  factory RainForNextDaysInfoModel.fromJson(Map<String, dynamic> json) => _$RainForNextDaysInfoModelFromJson(json);

  @override
  List<Object?> get props => [threeHours];
}
