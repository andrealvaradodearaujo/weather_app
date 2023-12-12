import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dart_extensions/date_extensions.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/weather_app/presentation/widgets/more_info_item_widget.dart';

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

  final double? feelsLike;
  final double? seaLevel;
  final double? grndLevel;
  final double? humidity;
  final String? weatherCondition;
  final double? windSpeed;
  final double? windDeg;
  final double? windGust;
  final double? cloudsAll;
  final double? visibility;
  final double? rainOneHour;
  final double? rainThreeHours;
  final double? snowOneHour;
  final double? snowThreeHours;
  final String? city;
  final String? country;
  final DateTime? sunrise;
  final DateTime? sunset;

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
              leftText: Strings.realFeel,
              rightText: "$feelsLike${Strings.celsiusDegree}",
            ),
          if (humidity != null)
            MoreInfoItemWidget(
              leftText: Strings.humidity,
              rightText: "$humidity${Strings.percentage}",
            ),
          if (rainOneHour != null)
            MoreInfoItemWidget(
              leftText: Strings.rainVolOneHour,
              rightText: "$rainOneHour ${Strings.millimeters}",
            ),
          if (rainThreeHours != null)
            MoreInfoItemWidget(
              leftText: Strings.rainVolThreeHour,
              rightText: "$rainThreeHours ${Strings.millimeters}",
            ),
          if (snowOneHour != null)
            MoreInfoItemWidget(
              leftText: Strings.snowVolOneHour,
              rightText: "$snowOneHour ${Strings.millimeters}",
            ),
          if (snowThreeHours != null)
            MoreInfoItemWidget(
              leftText: Strings.snowVolThreeHour,
              rightText: "$snowThreeHours ${Strings.millimeters}",
            ),
          if (weatherCondition != null)
            MoreInfoItemWidget(
              leftText: Strings.weatherCondition,
              rightText: weatherCondition!,
            ),
          if (sunrise != null)
            MoreInfoItemWidget(
              leftText: Strings.sunriseTime,
              rightText: sunrise!.formatDateTime(),
            ),
          if (sunset != null)
            MoreInfoItemWidget(
              leftText: Strings.sunsetTime,
              rightText: sunset!.formatDateTime(),
            ),
          if (city != null && country != null)
            MoreInfoItemWidget(
              leftText: Strings.cityCountry,
              rightText: "$city, $country"
            ),
          if (windSpeed != null)
            MoreInfoItemWidget(
              leftText: Strings.wind,
              rightText: "$windSpeed ${Strings.metersPerSeconds}",
            ),
          if (windDeg != null)
            MoreInfoItemWidget(
              leftText: Strings.windDirection,
              rightText: "$windDeg${Strings.degree}",
            ),
          if (windGust != null)
            MoreInfoItemWidget(
              leftText: Strings.windGust,
              rightText: "$windGust ${Strings.metersPerSeconds}",
            ),
          if (visibility != null)
            MoreInfoItemWidget(
              leftText: Strings.visibility,
              rightText: "$visibility ${Strings.meters}",
            ),
          if (cloudsAll != null)
            MoreInfoItemWidget(
              leftText: Strings.cloudiness,
              rightText: "$cloudsAll${Strings.percentage}",
            ),
          if (seaLevel != null)
            MoreInfoItemWidget(
              leftText: Strings.seaLevelAtmPressure,
              rightText: "$seaLevel ${Strings.hPa}",
            ),
          if (grndLevel != null)
            MoreInfoItemWidget(
              leftText: Strings.groundLevelAtmPressure,
              rightText: "$grndLevel ${Strings.hPa}",
            ),
        ],
      ),
    );
  }
}
