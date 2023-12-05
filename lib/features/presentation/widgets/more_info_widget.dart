import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/presentation/widgets/more_info_item_widget.dart';

class MoreInfoWidget extends StatelessWidget {
  const MoreInfoWidget({
    super.key,
    this.feelsLike,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.weatherCondition,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.cloudsAll,
    this.visibility,
    this.rainOneHour,
    this.rainThreeHours,
    this.snowOneHour,
    this.snowThreeHours,
    this.city,
    this.country,
    this.sunrise,
    this.sunset,
  });

  final double? feelsLike; ///OK
  final double? seaLevel;
  final double? grndLevel;
  final double? humidity; ///OK
  final String? weatherCondition; ///OK
  final double? windSpeed; ///OK
  final double? windDeg; ///OK
  final double? windGust; ///OK
  final double? cloudsAll; ///OK
  final double? visibility; ///OK
  final double? rainOneHour;///OK
  final double? rainThreeHours;///OK
  final double? snowOneHour;///OK
  final double? snowThreeHours;///OK
  final String? city; ///OK
  final String? country; ///OK
  final DateTime? sunrise; ///OK
  final DateTime? sunset; ///OK

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.I.getEdgeInsetsAll(25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Strings.moreInfo,
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          if (feelsLike != null)
            MoreInfoItemWidget(
              leftText: "RealFeel",
              rightText: "$feelsLikeºC",
            ),
          if (humidity != null)
            MoreInfoItemWidget(
              leftText: "Humidity",
              rightText: "$humidity%",
            ),
          if (rainOneHour != null)
            MoreInfoItemWidget(
              leftText: "Rain vol. 1h",
              rightText: "$rainOneHour mm",
            ),
          if (rainThreeHours != null)
            MoreInfoItemWidget(
              leftText: "Rain vol. 3h",
              rightText: "$rainThreeHours mm",
            ),
          if (snowOneHour != null)
            MoreInfoItemWidget(
              leftText: "Snow vol. 1h",
              rightText: "$snowOneHour mm",
            ),
          if (snowThreeHours != null)
            MoreInfoItemWidget(
              leftText: "Snow vol. 3h",
              rightText: "$snowThreeHours mm",
            ),
          if (weatherCondition != null)
            MoreInfoItemWidget(
              leftText: "Weather condition",
              rightText: weatherCondition!,
            ),
          if (sunrise != null)
            MoreInfoItemWidget(
              leftText: "Sunrise time",
              rightText: sunrise.toString(),//TODO: DateFormat('yyyy-MM-ddTHH:mm').format(sunrise),
            ),
          if (sunset != null)
            MoreInfoItemWidget(
              leftText: "Sunset time",
              rightText: sunset.toString(),//TODO: DateFormat('yyyy-MM-ddTHH:mm').format(sunrise),
            ),
          if (city != null && country != null)
            MoreInfoItemWidget(
              leftText: "City, Country",
              rightText: "$city, $country"
            ),
          if (windSpeed != null)
            MoreInfoItemWidget(
              leftText: "Wind",
              rightText: "$windSpeed m/sº",
            ),
          if (windDeg != null)
            MoreInfoItemWidget(
              leftText: "Wind direction",
              rightText: "$windDegº",
            ),
          if (windGust != null)
            MoreInfoItemWidget(
              leftText: "Wind gust",
              rightText: "$windGust m/sº",
            ),
          if (visibility != null)
            MoreInfoItemWidget(
              leftText: "Visibility",
              rightText: "$visibility m",
            ),
          if (cloudsAll != null)
            MoreInfoItemWidget(
              leftText: "Cloudiness",
              rightText: "$cloudsAll%",
            ),
          if (seaLevel != null)
            MoreInfoItemWidget(
              leftText: "Sea-level atm. pressure",
              rightText: "$seaLevel hPa",
            ),
          if (grndLevel != null)
            MoreInfoItemWidget(
              leftText: "Ground-level atm. pressure",
              rightText: "$grndLevel hPa",
            ),
        ],
      ),
    );
  }
}
