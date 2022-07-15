import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeatherByCity(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl({required this.client});

  final String apiKey = 'cc95d932d5a45d33a9527d5019475f2c';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final http.Client client;

  @override
  Future<WeatherModel> getCurrentWeatherByCity(String cityName) async {
    final response =
        await client.get(Uri.parse(currentWeatherByCity(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }

  String currentWeatherByCity(String city) =>
      '$baseUrl/weather?q=$city&appid=$apiKey';
}
