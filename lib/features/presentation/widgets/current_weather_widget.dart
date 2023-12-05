import 'package:flutter/material.dart';
import 'package:weather_app/features/domain/entities/current_weather.dart';
import 'package:weather_app/features/presentation/widgets/more_info_widget.dart';
import 'package:weather_app/features/presentation/widgets/resumed_current_weather_info_widget.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key, required this.cw});

  final CurrentWeather cw;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ResumedCurrentWeatherInfoWidget(
                cityName: cw.cityName,
                iconUrl: cw.iconUrl,
                temperature: cw.temp,
                weatherGroup: cw.mainGroupWeather,
                minTemperature: cw.tempMin,
                maxTemperature: cw.tempMax,
              ),
              MoreInfoWidget(
                feelsLike: cw.feelsLike,
                seaLevel: cw.seaLevel,
                grndLevel: cw.grndLevel,
                humidity: cw.humidity,
                weatherCondition: cw.description,
                windSpeed: cw.windSpeed,
                windDeg: cw.windDeg,
                windGust: cw.windGust,
                cloudsAll: cw.cloudsAll,
                visibility: cw.visibility,
                rainThreeHours: cw.rainThreeHours,
                snowThreeHours: cw.snowThreeHours,
                city: cw.cityName,
                country: cw.country,
                sunrise: cw.sunrise,
                sunset: cw.sunset,
              )
            ],
          ),
        ),
      ),
    );
  }
}
