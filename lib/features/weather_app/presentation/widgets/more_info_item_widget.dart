import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dimensions.dart';

class MoreInfoItemWidget extends StatelessWidget {
  const MoreInfoItemWidget({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftText,
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            Text(
              rightText,
              style: TextStyle(
                fontSize: 23.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ],
    );
  }
}
