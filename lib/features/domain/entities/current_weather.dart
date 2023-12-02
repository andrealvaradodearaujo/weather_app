class CurrentWeather {
  CurrentWeather({
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
    this.icon,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.cloudsAll,
    this.visibility,
    this.sysCountry,
    this.sysSunrise,
    this.sysSunset,
    this.dt,
    this.rainOneHour,
    this.rainThreeHours,
    this.snowOneHour,
    this.snowThreeHours,
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
  final String? icon;
  final double? windSpeed;
  final double? windDeg;
  final double? windGust;
  final double? cloudsAll;
  final double? visibility;
  final double? rainOneHour;
  final double? rainThreeHours;
  final double? snowOneHour;
  final double? snowThreeHours;
  final String? sysCountry;
  final DateTime? sysSunrise;
  final DateTime? sysSunset;
  final DateTime? dt;
}
