import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/features/presentation/bloc/cities/cities_bloc.dart';
import 'package:weather_app/features/presentation/page/cities_page.dart';
import 'package:weather_app/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CitiesBloc cityBloc = CitiesBloc();

  MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => cityBloc,
        child: const CitiesPage(),
      ),
      builder: (context, widget) {
        Dimensions(width: 360, height: 640, allowFontScaling: true).init(context);
        return widget ?? Container();
      },
    );
  }
}

