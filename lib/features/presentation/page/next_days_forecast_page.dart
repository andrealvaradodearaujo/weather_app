import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/core/ui/loading_widget.dart';
import 'package:weather_app/features/presentation/bloc/next_days_forecast/next_days_forecast_bloc.dart';
import 'package:weather_app/features/presentation/widgets/next_day_forecast_widget.dart';

class NextDaysForecastPage extends StatelessWidget {
  const NextDaysForecastPage({super.key, required this.cityCountry});

  final String? cityCountry;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextDaysForecastBloc, NextDaysForecastState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Scaffold(
            body: Center(
              child: LoadingWidget(),
            ),
          );
        } else if (state is ErrorState) {
          //TODO: implement better error state scenario
          return const Scaffold(
            body: Center(
              child: Text("There is no next days forecast available"),
            ),
          );
        } else if (state is SuccessState) {
          List<Widget> result = [];
          state.nextDaysForecast.map.forEach(
            (currentDay, nextDaysForecastList) {
              result.add(
                NextDayForecastWidget(
                  currentDay: currentDay,
                  nextDayWeatherList: nextDaysForecastList,
                  cityCountry: cityCountry,
                ),
              );
              result.add(
                SizedBox(
                  height: 40.h,
                ),
              );
            },
          );
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                scrolledUnderElevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Routemaster.of(context).pop(),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: Dimensions.I.getEdgeInsetsAll(20.w),
                  child: Column(
                      children: result
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
