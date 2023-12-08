import 'package:flutter/material.dart';
import 'package:weather_app/features/domain/entities/next_day_weather.dart';
import 'package:weather_app/features/presentation/widgets/more_info_widget.dart';
import 'package:weather_app/features/presentation/widgets/resumed_current_weather_info_widget.dart';
import 'package:weather_app/features/presentation/widgets/weather_sliver_app_bar.dart';

class NextDayByHourWeatherWidget extends StatelessWidget {
  const NextDayByHourWeatherWidget({
    super.key,
    required this.ndw,
    required this.cityCountry,
  });

  final NextDayWeather ndw;
  final String cityCountry;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      snap: true,
      snapSizes: const [0.9, 1.0],
      builder: (context, scrollController) {
        return CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              delegate: WeatherSliverAppBar(city: cityCountry),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ResumedCurrentWeatherInfoWidget(
                    iconUrl: ndw.iconUrl,
                    temperature: ndw.temp,
                    weatherGroup: ndw.mainGroupWeather,
                    hasNext5DaysButton: false,
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
            )
          ],
        );
      },
    );
  }
}
