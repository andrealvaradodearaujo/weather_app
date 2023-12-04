import 'package:injectable/injectable.dart';
import 'package:weather_app/features/domain/repositories/weather_repository.dart';

@injectable
class GetCitiesUseCase {
  GetCitiesUseCase(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  List<String> call() => _weatherRepository.getCities();

}
