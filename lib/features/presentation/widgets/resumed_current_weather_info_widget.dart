import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/core/ui/rounded_button.dart';
import 'package:weather_app/features/presentation/bloc/next_days_forecast/next_days_forecast_bloc.dart';

class ResumedCurrentWeatherInfoWidget extends StatelessWidget {
  const ResumedCurrentWeatherInfoWidget({
    super.key,
    this.cityName,
    this.iconUrl,
    this.temperature,
    this.weatherGroup,
    this.minTemperature,
    this.maxTemperature,
    this.cityCountry,
    this.hasNext5DaysButton = true,
  });

  final String? cityName;
  final String? iconUrl;
  final double? temperature;
  final String? weatherGroup;
  final double? minTemperature;
  final double? maxTemperature;
  final String? cityCountry;
  final bool hasNext5DaysButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        if (cityName != null)
          Text(
            cityName!,
            style: TextStyle(
              fontSize: 50.sp,
              color: Colors.black,
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconUrl != null)
              Image.network(
                iconUrl!,
                width: 150.w,
                height: 150.w,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return const SizedBox(
                    width: 0,
                  );
                },
              ),
            if (temperature != null)
              Row(
                children: [
                  Text(
                    "${temperature!.round()}º",
                    style: TextStyle(
                      fontSize: 70.sp,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    Strings.celsiusUnit,
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.black,
                    ),
                    strutStyle: const StrutStyle(forceStrutHeight: true),
                  ),
                  SizedBox(
                    width: 20.w,
                  )
                ],
              ),
          ],
        ),
        if (weatherGroup != null)
          Text(
            weatherGroup!,
            style: TextStyle(
              fontSize: 30.sp,
              color: Colors.black,
            ),
          ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (minTemperature != null)
              Text(
                "${Strings.minTemperature}. ${minTemperature!.round()}º",
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.black,
                ),
              ),
            if (minTemperature != null && maxTemperature != null)
              SizedBox(
                width: 20.w,
              ),
            if (maxTemperature != null)
              Text(
                "${Strings.maxTemperature}. ${maxTemperature!.round()}º",
                style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.black,
                ),
              ),
          ],
        ),
        if (hasNext5DaysButton)
          Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              RoundedButton(
                onTapFunction: () {
                  BlocProvider.of<NextDaysForecastBloc>(context).add(GetNextDaysForecastEvent(city: cityCountry ?? ""));
                  Routemaster.of(context).push('/nextDaysForecast/$cityCountry');
                },
                text: Strings.next5DaysForecast,
              )
            ],
          ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
