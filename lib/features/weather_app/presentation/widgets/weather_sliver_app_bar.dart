import 'package:flutter/material.dart';
import 'package:weather_app/core/resources/dimensions.dart';

class WeatherSliverAppBar extends SliverPersistentHeaderDelegate {
  final String city;

  WeatherSliverAppBar({required this.city});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0xFF94908F),
      child: Center(
        child: Text(
          city,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}