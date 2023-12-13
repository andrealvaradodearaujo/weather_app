import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:weather_app/core/ui/error_page.dart';
import 'package:weather_app/core/ui/loading_widget.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/widgets/current_weather_widget.dart';

class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({super.key, required this.cityCountry});

  final String? cityCountry;

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
          return ErrorPage(
            onTryAgainFunction: () {
              BlocProvider.of<CurrentWeatherBloc>(context).add(GetCurrentWeatherEvent(city: cityCountry ?? ""));
              Routemaster.of(context).push('/currentWeather/$cityCountry');
            },
            text: state.message,
          );
        } else if (state is SuccessState) {
          return CurrentWeatherWidget(
            cw: state.currentWeather,
            cityCountry: cityCountry,
          );
        }
        return Container();
      },
    );
  }
}
