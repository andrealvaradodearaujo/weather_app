import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dimensions.dart';

class NextDaysForecastPage extends StatefulWidget {
  const NextDaysForecastPage({super.key});

  @override
  State<NextDaysForecastPage> createState() => _NextDaysForecastPageState();
}

class _NextDaysForecastPageState extends State<NextDaysForecastPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Temporary",
                  style: TextStyle(
                    fontSize: 50.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
