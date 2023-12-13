import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:routemaster/routemaster.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/features/cities/presentation/bloc/cities_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/next_days_forecast/next_days_forecast_bloc.dart';
import 'package:weather_app/features/cities/presentation/pages/cities_page.dart';
import 'package:weather_app/features/weather/presentation/page/current_weather_page.dart';
import 'package:weather_app/features/weather/presentation/page/next_days_forecast_page.dart';
import 'package:weather_app/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.level = Level.debug;
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routes = RouteMap(routes: {
      '/': (_) => const MaterialPage(child: CitiesPage()),
      '/currentWeather/:cityCountry': (info) {
        final decodedCityCountry = Uri.decodeComponent(info.pathParameters['cityCountry'] ?? '');
        return MaterialPage(
          child: CurrentWeatherPage(cityCountry: decodedCityCountry),
        );
      },
      '/nextDaysForecast/:cityCountry': (info) {
        final decodedCityCountry = Uri.decodeComponent(info.pathParameters['cityCountry'] ?? '');
        return MaterialPage(
          child: NextDaysForecastPage(cityCountry: decodedCityCountry),
        );
      },
    });

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetIt.I.get<CitiesBloc>(),
          ),
          BlocProvider(
            create: (context) => GetIt.I.get<CurrentWeatherBloc>(),
          ),
          BlocProvider(
            create: (context) => GetIt.I.get<NextDaysForecastBloc>(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
          routeInformationParser: const RoutemasterParser(),
          builder: (context, widget) {
            Dimensions(width: 480, height: 800, allowFontScaling: true).init(context);
            return widget ?? Container();
          },
        ));
  }
}
