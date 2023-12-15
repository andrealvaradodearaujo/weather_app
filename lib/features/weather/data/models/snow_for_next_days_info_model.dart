import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'snow_for_next_days_info_model.g.dart';

@JsonSerializable()
class SnowForNextDaysInfoModel extends Equatable{
  const SnowForNextDaysInfoModel(this.threeHours);
  @JsonKey(name: '3h')
  final double? threeHours;

  Map<String, dynamic> toJson() => _$SnowForNextDaysInfoModelToJson(this);

  factory SnowForNextDaysInfoModel.fromJson(Map<String, dynamic> json) => _$SnowForNextDaysInfoModelFromJson(json);

  @override
  List<Object?> get props => [threeHours];
}
