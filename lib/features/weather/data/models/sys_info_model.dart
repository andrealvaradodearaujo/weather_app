import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sys_info_model.g.dart';

@JsonSerializable()
class SysInfoModel extends Equatable{
  const SysInfoModel(this.country, this.sunrise, this.sunset);
  final String? country;
  final int? sunrise;
  final int? sunset;

  Map<String, dynamic> toJson() => _$SysInfoModelToJson(this);

  factory SysInfoModel.fromJson(Map<String, dynamic> json) => _$SysInfoModelFromJson(json);

  @override
  List<Object?> get props => [country, sunrise, sunset];
}
