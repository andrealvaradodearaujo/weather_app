// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain_for_current_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RainForCurrentInfoModel _$RainForCurrentInfoModelFromJson(
        Map<String, dynamic> json) =>
    RainForCurrentInfoModel(
      (json['1h'] as num?)?.toDouble(),
      (json['3h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RainForCurrentInfoModelToJson(
        RainForCurrentInfoModel instance) =>
    <String, dynamic>{
      '1h': instance.oneHour,
      '3h': instance.threeHours,
    };
