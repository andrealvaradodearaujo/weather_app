import 'package:injectable/injectable.dart';
import 'package:weather_app/features/domain/repositories/weather_repository.dart';

/// Use case responsible for retrieving a list of cities for weather information.
@injectable
class GetCitiesUseCase {

  /// Constructs the [GetCitiesUseCase] with the specified [WeatherRepository].
  ///
  /// [_weatherRepository] Repository providing access to weather-related data.
  GetCitiesUseCase(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  /// Invokes the use case to retrieve a list of cities.
  ///
  /// Returns a list of strings representing city names for which weather information is available.
  List<String> call() => _weatherRepository.getCities();
}
