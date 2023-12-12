// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainInfoModel _$MainInfoModelFromJson(Map<String, dynamic> json) =>
    MainInfoModel(
      (json['temp'] as num?)?.toDouble(),
      (json['feels_like'] as num?)?.toDouble(),
      (json['temp_min'] as num?)?.toDouble(),
      (json['temp_max'] as num?)?.toDouble(),
      (json['pressure'] as num?)?.toDouble(),
      (json['sea_level'] as num?)?.toDouble(),
      (json['grnd_level'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainInfoModelToJson(MainInfoModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.grndLevel,
      'humidity': instance.humidity,
    };
