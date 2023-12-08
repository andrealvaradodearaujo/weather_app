import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:weather_app/features/domain/entities/current_weather.dart';
import 'package:weather_app/features/presentation/widgets/more_info_widget.dart';
import 'package:weather_app/features/presentation/widgets/resumed_current_weather_info_widget.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key, required this.cw, this.cityCountry});

  final CurrentWeather cw;
  final String? cityCountry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Routemaster.of(context).pop(),
          ),
        ),
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
                cityCountry: cityCountry,
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
                rainOneHour: cw.rainOneHour,
                rainThreeHours: cw.rainThreeHours,
                snowOneHour: cw.snowOneHour,
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
