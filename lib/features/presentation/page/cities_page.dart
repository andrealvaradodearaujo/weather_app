import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/resources/dimensions.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/presentation/bloc/cities/cities_bloc.dart';

class CitiesPage extends StatefulWidget {
  const CitiesPage({super.key});

  @override
  State<CitiesPage> createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  @override
  void initState() {
    BlocProvider.of<CitiesBloc>(context).add(const InitializeEvent(cities: [
      Strings.citySilverstoneUK,
      Strings.citySaoPauloBrazil,
      Strings.cityMelbourneAustralia,
      Strings.cityMonteCarloMonaco
    ]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // When the user taps anywhere outside the text field, the focus is removed, and the keyboard is dismissed.
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: Dimensions.I.getEdgeInsets(top: 40,),
          child: Column(
            children: [
              BlocBuilder<CitiesBloc, CitiesState>(
                builder: (context, state) {
                  return TextField(
                    onChanged: (selectedCity) {
                      BlocProvider.of<CitiesBloc>(context).add(
                          SearchCityEvent(city: selectedCity, cities: (state is CitiesLoadedState) ? state.allCities : []));
                    },
                    decoration: const InputDecoration(labelText: Strings.searchCity),
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<CitiesBloc, CitiesState>(
                  builder: (context, state) {
                    if (state is CitiesLoadedState) {
                      return ListView.builder(
                        itemCount: state.filteredCities.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.filteredCities[index]),
                          );
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
