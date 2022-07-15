import '../../data/models/weather_model.dart';
import '../repositories/weather_repository.dart';

class GetWeatherUsecase {
  GetWeatherUsecase(this.weatherRepository);

  final WeatherRepository weatherRepository;

  Future<WeatherModel> call(String cityName) {
    return weatherRepository.getCurrentWeatherByCity(cityName);
  }
}
