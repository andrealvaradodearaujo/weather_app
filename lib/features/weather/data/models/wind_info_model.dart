import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind_info_model.g.dart';

@JsonSerializable()
class WindInfoModel extends Equatable{
  const WindInfoModel(this.speed, this.deg, this.gust);
  final double? speed;
  final double? deg;
  final double? gust;

  Map<String, dynamic> toJson() => _$WindInfoModelToJson(this);

  factory WindInfoModel.fromJson(Map<String, dynamic> json) => _$WindInfoModelFromJson(json);

  @override
  List<Object?> get props => [speed, deg, gust];
}
