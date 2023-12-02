// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_day_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextDayWeatherModel _$NextDayWeatherModelFromJson(Map<String, dynamic> json) =>
    NextDayWeatherModel(
      MainInfoModel.fromJson(json['main'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      WindInfoModel.fromJson(json['wind'] as Map<String, dynamic>),
      CloudsInfoModel.fromJson(json['clouds'] as Map<String, dynamic>),
      (json['visibility'] as num?)?.toDouble(),
      json['rain'] == null
          ? null
          : RainForNextDaysInfoModel.fromJson(
              json['rain'] as Map<String, dynamic>),
      json['snow'] == null
          ? null
          : SnowForNextDaysInfoModel.fromJson(
              json['snow'] as Map<String, dynamic>),
      (json['pop'] as num?)?.toDouble(),
      json['dt'] as int,
    );

Map<String, dynamic> _$NextDayWeatherModelToJson(
        NextDayWeatherModel instance) =>
    <String, dynamic>{
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'rain': instance.rain,
      'snow': instance.snow,
      'dt': instance.dt,
      'pop': instance.pop,
    };
