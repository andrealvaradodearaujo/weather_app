import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dimensions.dart';

class LoadingWidget extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double size;
  final double strokeWidth;
  final Color color;
  const LoadingWidget({
    super.key,
    this.margin,
    this.size = 30,
    this.strokeWidth = 5,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: size.w,
      width: size.w,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}
