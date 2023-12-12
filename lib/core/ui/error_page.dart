import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/core/ui/rounded_button.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.onTryAgainFunction,
    required this.text,
  });

  final VoidCallback onTryAgainFunction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Routemaster.of(context).history.back(),
          ),
        ),
        body: Padding(
          padding: Dimensions.I.getEdgeInsetsSymmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontSize: 20.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RoundedButton(
                      onTapFunction: onTryAgainFunction,
                      text: Strings.tryAgain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
