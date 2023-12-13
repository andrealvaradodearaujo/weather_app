import 'package:injectable/injectable.dart';
import 'package:weather_app/features/cities/domain/repositories/cities_repository.dart';

/// Use case responsible for retrieving a list of cities for weather information.
@injectable
class GetCitiesUseCase {
  GetCitiesUseCase(this._citiesRepository);

  final CitiesRepository _citiesRepository;

  /// Invokes the use case to retrieve a list of cities.
  ///
  /// Returns a list of strings representing city names for which weather information is available.
  List<String> call() => _citiesRepository.getCities();
}
