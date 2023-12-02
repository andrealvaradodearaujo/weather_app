// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow_for_current_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnowForCurrentInfoModel _$SnowForCurrentInfoModelFromJson(
        Map<String, dynamic> json) =>
    SnowForCurrentInfoModel(
      (json['1h'] as num?)?.toDouble(),
      (json['3h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SnowForCurrentInfoModelToJson(
        SnowForCurrentInfoModel instance) =>
    <String, dynamic>{
      '1h': instance.oneHour,
      '3h': instance.threeHours,
    };
