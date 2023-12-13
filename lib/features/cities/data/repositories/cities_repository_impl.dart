import 'package:injectable/injectable.dart';
import 'package:weather_app/core/resources/strings.dart';
import 'package:weather_app/features/cities/domain/repositories/cities_repository.dart';

@Injectable(as: CitiesRepository)
class CitiesRepositoryImpl implements CitiesRepository {

  /// Retrieves a list of city names.
  @override
  List<String> getCities() {
    return [
      Strings.citySilverstoneUK,
      Strings.citySaoPauloBrazil,
      Strings.cityMelbourneAustralia,
      Strings.cityMonteCarloMonaco
    ];
  }
}
