import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/core/resources/strings.dart';

class ResumedNextDayByHourWeatherWidget extends StatelessWidget {
  const ResumedNextDayByHourWeatherWidget({
    super.key,
    this.hourMin,
    this.iconUrl,
    this.temperature,
    this.realFeel,
    this.humidity,
    required this.onTapFunction,
  });

  final String? hourMin;
  final String? iconUrl;
  final double? temperature;
  final double? realFeel;
  final double? humidity;
  final VoidCallback onTapFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        padding: Dimensions.I.getEdgeInsetsAll(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (hourMin != null)
              Flexible(
                child: Text(
                  hourMin!,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            if (iconUrl != null)
              Flexible(
                child: Image.network(
                  iconUrl!,
                  width: 70.w,
                  height: 70.w,
                  fit: BoxFit.cover,
                ),
              ),
            if (temperature != null)
              Flexible(
                child: Row(
                  children: [
                    Text(
                      "${temperature!.round()}${Strings.degree}",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      Strings.celsiusUnit,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),
                      strutStyle: const StrutStyle(forceStrutHeight: true),
                    ),
                  ],
                ),
              ),
            if (realFeel != null)
              Flexible(
                flex: 2,
                child: Text(
                  "${Strings.realFeel} ${realFeel!.round()}${Strings.degree}",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            if (humidity != null)
              Row(
                children: [
                  Image.asset(
                    "assets/icons/humidity_icon.png",
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "${humidity!.round()}${Strings.percentage}",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}