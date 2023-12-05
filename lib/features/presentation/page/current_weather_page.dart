import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/ui/loading_widget.dart';
import 'package:weather_app/features/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:weather_app/features/presentation/widgets/current_weather_widget.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
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
              child: Text("There is no current weather available"),
            ),
          );
        } else if (state is SuccessState) {
          return CurrentWeatherWidget(cw: state.currentWeather);
        }
        return Container();
      },
    );
  }
}
