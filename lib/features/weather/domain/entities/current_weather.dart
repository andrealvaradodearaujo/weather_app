import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {
  const CurrentWeather({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.mainGroupWeather,
    this.description,
    this.iconUrl,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.cloudsAll,
    this.visibility,
    this.country,
    this.sunrise,
    this.sunset,
    this.dt,
    this.rainOneHour,
    this.rainThreeHours,
    this.snowOneHour,
    this.snowThreeHours,
    this.cityName,
  });

  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final double? pressure;
  final double? seaLevel;
  final double? grndLevel;
  final double? humidity;
  final String? mainGroupWeather;
  final String? description;
  final String? iconUrl;
  final double? windSpeed;
  final double? windDeg;
  final double? windGust;
  final double? cloudsAll;
  final double? visibility;
  final double? rainOneHour;
  final double? rainThreeHours;
  final double? snowOneHour;
  final double? snowThreeHours;
  final String? country;
  final DateTime? sunrise;
  final DateTime? sunset;
  final DateTime? dt;
  final String? cityName;

  @override
  List<Object?> get props => [
    temp,
    feelsLike,
    tempMin,
    tempMax,
    pressure,
    seaLevel,
    grndLevel,
    humidity,
    mainGroupWeather,
    description,
    iconUrl,
    windSpeed,
    windDeg,
    windGust,
    cloudsAll,
    visibility,
    rainOneHour,
    rainThreeHours,
    snowOneHour,
    snowThreeHours,
    country,
    sunrise,
    sunset,
    dt,
    cityName,
  ];
}