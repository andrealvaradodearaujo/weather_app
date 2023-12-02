import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/resources/settings.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/domain/entities/current_weather.dart';
import 'package:weather_app/features/domain/repositories/weather_repository.dart';

@injectable
class GetCurrentWeatherUseCase {
  GetCurrentWeatherUseCase(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  Future<Either<Failure, CurrentWeather>> call(String city) async {
    late double lat;
    late double lon;

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
    return await _weatherRepository.getCurrentWeather(lat, lon);
  }

}
