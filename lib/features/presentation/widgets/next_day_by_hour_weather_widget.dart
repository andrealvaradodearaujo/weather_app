import 'package:flutter/material.dart';
import 'package:weather_app/features/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/presentation/widgets/more_info_widget.dart';
import 'package:weather_app/features/presentation/widgets/resumed_current_weather_info_widget.dart';

class NextDayByHourWeatherWidget extends StatelessWidget {
  const NextDayByHourWeatherWidget({
    super.key,
    required this.ndw,
  });

  final NextDayWeather ndw;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ResumedCurrentWeatherInfoWidget(
                cityName: ndw.city,
                iconUrl: ndw.iconUrl,
                temperature: ndw.temp,
                weatherGroup: ndw.mainGroupWeather,
                minTemperature: ndw.tempMin,
                maxTemperature: ndw.tempMax,
                cityCountry: '',
              ),
              MoreInfoWidget(
                feelsLike: ndw.feelsLike,
                seaLevel: ndw.seaLevel,
                grndLevel: ndw.grndLevel,
                humidity: ndw.humidity,
                weatherCondition: ndw.description,
                windSpeed: ndw.windSpeed,
                windDeg: ndw.windDeg,
                windGust: ndw.windGust,
                cloudsAll: ndw.cloudsAll,
                visibility: ndw.visibility,
                rainThreeHours: ndw.rainThreeHours,
                snowThreeHours: ndw.snowThreeHours,
                city: ndw.city,
                country: ndw.country,
              )
            ],
          ),
        ),
      ),
    );
  }
}
