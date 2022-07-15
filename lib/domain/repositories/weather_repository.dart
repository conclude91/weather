import '../../data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getCurrentWeatherByCity(String cityName);
}
