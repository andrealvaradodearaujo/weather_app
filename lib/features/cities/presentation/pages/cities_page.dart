import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/core/resources/widget_keys.dart';
import 'package:weather_app/features/cities/presentation/bloc/cities_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({super.key});

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  @override
  void initState() {
    BlocProvider.of<CitiesBloc>(context).add(InitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesBloc, CitiesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            // When the user taps anywhere outside the text field, the focus is removed, and the keyboard is dismissed.
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            body: Padding(
              padding: Dimensions.I.getEdgeInsets(top: 40),
              child: Column(
                children: [
                  TextField(
                    key: const ValueKey(WidgetKeys.searchTextField),
                    onChanged: (selectedCity) {
                      BlocProvider.of<CitiesBloc>(context).add(SearchCityEvent(
                          city: selectedCity, cities: (state is CitiesLoadedState) ? state.allCities : []));
                    },
                    decoration: const InputDecoration(labelText: Strings.searchCity),
                  ),
                  Expanded(
                    child: (state is CitiesLoadedState)
                        ? ListView.builder(
                            itemCount: state.filteredCities.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  BlocProvider.of<CurrentWeatherBloc>(context)
                                      .add(GetCurrentWeatherEvent(city: state.filteredCities[index]));
                                  Routemaster.of(context).push('/currentWeather/${state.filteredCities[index]}');
                                },
                                child: ListTile(
                                  title: Text(state.filteredCities[index]),
                                ),
                              );
                            },
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
