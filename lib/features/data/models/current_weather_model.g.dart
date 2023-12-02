// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherModel _$CurrentWeatherModelFromJson(Map<String, dynamic> json) =>
    CurrentWeatherModel(
      MainInfoModel.fromJson(json['main'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      WindInfoModel.fromJson(json['wind'] as Map<String, dynamic>),
      CloudsInfoModel.fromJson(json['clouds'] as Map<String, dynamic>),
      (json['visibility'] as num?)?.toDouble(),
      json['rain'] == null
          ? null
          : RainForCurrentInfoModel.fromJson(
              json['rain'] as Map<String, dynamic>),
      json['snow'] == null
          ? null
          : SnowForCurrentInfoModel.fromJson(
              json['snow'] as Map<String, dynamic>),
      json['sys'] == null
          ? null
          : SysInfoModel.fromJson(json['sys'] as Map<String, dynamic>),
      json['dt'] as int?,
    );

Map<String, dynamic> _$CurrentWeatherModelToJson(
        CurrentWeatherModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'rain': instance.rain,
      'snow': instance.snow,
      'sys': instance.sys,
      'dt': instance.dt,
    };
