import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'snow_for_current_info_model.g.dart';

@JsonSerializable()
class SnowForCurrentInfoModel extends Equatable{
  const SnowForCurrentInfoModel(this.oneHour, this.threeHours);
  @JsonKey(name: '1h')
  final double? oneHour;
  @JsonKey(name: '3h')
  final double? threeHours;

  Map<String, dynamic> toJson() => _$SnowForCurrentInfoModelToJson(this);

  factory SnowForCurrentInfoModel.fromJson(Map<String, dynamic> json) => _$SnowForCurrentInfoModelFromJson(json);

  @override
  List<Object?> get props => [oneHour, threeHours];
}
