import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dimensions.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.onTapFunction,
    required this.text,
  });

  final VoidCallback onTapFunction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        padding: Dimensions.I.getEdgeInsetsAll(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          border: Border.all(),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  }
}
