import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_info_model.g.dart';

@JsonSerializable()
class MainInfoModel extends Equatable{
  const MainInfoModel(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure,
      this.seaLevel, this.grndLevel, this.humidity);
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final double? pressure;
  final double? seaLevel;
  final double? grndLevel;
  final double? humidity;

  Map<String, dynamic> toJson() => _$MainInfoModelToJson(this);

  factory MainInfoModel.fromJson(Map<String, dynamic> json) => _$MainInfoModelFromJson(json);

  @override
  List<Object?> get props => [temp, feelsLike, tempMin, tempMax, pressure, seaLevel, grndLevel, humidity];

}
