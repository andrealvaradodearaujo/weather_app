import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clouds_info_model.g.dart';

@JsonSerializable()
class CloudsInfoModel extends Equatable{
  const CloudsInfoModel(this.all);
  final double? all;

  Map<String, dynamic> toJson() => _$CloudsInfoModelToJson(this);

  factory CloudsInfoModel.fromJson(Map<String, dynamic> json) => _$CloudsInfoModelFromJson(json);

  @override
  List<Object?> get props => [all];
}
