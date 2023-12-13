import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/resources/settings.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/weather/domain/entities/next_days_forecast.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

/// Use case responsible for retrieving the next days' weather forecast for a specific city.
@injectable
class GetNextDaysForecastUseCase {

  /// Constructs the [GetNextDaysForecastUseCase] with the specified [WeatherRepository].
  ///
  /// [_weatherRepository] Repository providing access to weather-related data.
  GetNextDaysForecastUseCase(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  /// Invokes the use case to retrieve the next days' weather forecast for the specified city.
  ///
  /// [city] The name of the city for which the weather forecast is requested.
  ///
  /// Returns a [Future] with either a [NextDaysForecast] or a [Failure].
  /// - If successful, a [Right] containing the [NextDaysForecast] for the city.
  /// - If unsuccessful, a [Left] containing a [Failure] indicating the error.
  Future<Either<Failure, NextDaysForecast>> call(String city) async {
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

    // Retrieve the next days' weather forecast for the specified coordinates.
    return await _weatherRepository.getNextDaysForecast(lat, lon);
  }
}
