import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dart_extensions/date_extensions.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/features/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/presentation/widgets/next_day_by_hour_weather_widget.dart';
import 'package:weather_app/features/presentation/widgets/resumed_next_day_by_hour_weather_widget.dart';

class NextDayForecastWidget extends StatelessWidget {
  const NextDayForecastWidget({
    super.key,
    required this.currentDay,
    required this.nextDayWeatherList,
    required this.cityCountry,
  });

  final DateTime currentDay;
  final List<NextDayWeather> nextDayWeatherList;
  final String? cityCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              currentDay.formatWeekDayAndDateTime(),
              style: TextStyle(
                fontSize: 20.sp,
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: nextDayWeatherList.length,
          itemBuilder: (context, index) {
            return ResumedNextDayByHourWeatherWidget(
              hourMin: nextDayWeatherList[index].dt.formatHourMin(),
              iconUrl: nextDayWeatherList[index].iconUrl,
              temperature: nextDayWeatherList[index].temp,
              realFeel: nextDayWeatherList[index].feelsLike,
              humidity: nextDayWeatherList[index].humidity,
              onTapFunction: () {
                _showNextDayByHourWeatherModal(context, nextDayWeatherList[index], cityCountry ?? "");
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15.h,
            );
          },
        ),
      ],
    );
  }

  void _showNextDayByHourWeatherModal(BuildContext context, NextDayWeather nextDayWeather, String cityCountry) {
    showModalBottomSheet(
      enableDrag: true,
      useSafeArea: true,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.w),
          topRight: Radius.circular(20.w),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return NextDayByHourWeatherWidget(ndw: nextDayWeather, cityCountry: cityCountry);
      },
    );
  }
}
