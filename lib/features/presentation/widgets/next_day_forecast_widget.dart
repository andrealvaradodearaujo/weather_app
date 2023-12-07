import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dart_extensions/date_extensions.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/features/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/presentation/widgets/resumed_next_day_by_hour_weather_widget.dart';

class NextDayForecastWidget extends StatelessWidget {
  const NextDayForecastWidget({
    super.key,
    required this.currentDay,
    required this.nextDayWeatherList,
  });

  final DateTime currentDay;
  final List<NextDayWeather> nextDayWeatherList;

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
            return InkWell(
              onTap: () {},
              child: ResumedNextDayByHourWeatherWidget(
                hourMin: nextDayWeatherList[index].dt.formatHourMin(),
                iconUrl: nextDayWeatherList[index].iconUrl,
                temperature: nextDayWeatherList[index].temp,
                realFeel: nextDayWeatherList[index].feelsLike,
                humidity: nextDayWeatherList[index].humidity,
              ),
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
}
