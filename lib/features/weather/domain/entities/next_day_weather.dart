import 'package:equatable/equatable.dart';

class NextDayWeather extends Equatable {
  const NextDayWeather({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.pop,
    this.humidity,
    this.mainGroupWeather,
    this.description,
    this.iconUrl,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.cloudsAll,
    this.visibility,
    this.rainThreeHours,
    this.snowThreeHours,
    required this.dt,
  });

  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final double? pressure;
  final double? seaLevel;
  final double? grndLevel;
  final double? humidity;
  final double? pop;
  final String? mainGroupWeather;
  final String? description;
  final String? iconUrl;
  final double? windSpeed;
  final double? windDeg;
  final double? windGust;
  final double? cloudsAll;
  final double? visibility;
  final double? rainThreeHours;
  final double? snowThreeHours;
  final DateTime dt;

  @override
  List<Object?> get props => [
    temp,
    feelsLike,
    tempMin,
    tempMax,
    pressure,
    seaLevel,
    grndLevel,
    pop,
    humidity,
    mainGroupWeather,
    description,
    iconUrl,
    windSpeed,
    windDeg,
    windGust,
    cloudsAll,
    visibility,
    rainThreeHours,
    snowThreeHours,
    dt,
  ];
}