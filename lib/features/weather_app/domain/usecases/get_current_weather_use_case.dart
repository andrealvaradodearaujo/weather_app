import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/resources/settings.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/weather_app/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather_app/domain/repositories/weather_repository.dart';

/// Use case responsible for retrieving the current weather for a specific city.
@injectable
class GetCurrentWeatherUseCase {

  /// Constructs the [GetCurrentWeatherUseCase] with the specified [WeatherRepository].
  ///
  /// [_weatherRepository] Repository providing access to weather-related data.
  GetCurrentWeatherUseCase(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  /// Invokes the use case to retrieve the current weather for the specified city.
  ///
  /// [city] The name of the city for which weather information is requested.
  ///
  /// Returns a [Future] with either a [CurrentWeather] or a [Failure].
  /// - If successful, a [Right] containing the [CurrentWeather] for the city.
  /// - If unsuccessful, a [Left] containing a [Failure] indicating the error.
  Future<Either<Failure, CurrentWeather>> call(String city) async {
    late double lat;
    late double lon;

    // Determine the coordinates based on the provided city name.
    switch(city){
      case Strings.citySilverstoneUK:
        lat = Settings.latSilverstoneUK;
        lon = Settings.lonSilverstoneUK;
        break;
      case Strings.citySaoPauloBrazil:
        lat = Settings.latSaoPauloBR;
        lon = Settings.lonSaoPauloBR;
        break;
      case Strings.cityMelbourneAustralia:
        lat = Settings.latMelbourneAU;
        lon = Settings.lonMelbourneAU;
        break;
      case Strings.cityMonteCarloMonaco:
        lat = Settings.latMonteCarloMO;
        lon = Settings.lonMonteCarloMO;
        break;
      default:
        return Left(GenericFailure(Strings.invalidCity));
    }

    // Retrieve the current weather for the specified coordinates.
    return await _weatherRepository.getCurrentWeather(lat, lon);
  }
}
