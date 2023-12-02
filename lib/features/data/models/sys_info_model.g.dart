// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysInfoModel _$SysInfoModelFromJson(Map<String, dynamic> json) => SysInfoModel(
      json['country'] as String,
      json['sunrise'] as int,
      json['sunset'] as int,
    );

Map<String, dynamic> _$SysInfoModelToJson(SysInfoModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
