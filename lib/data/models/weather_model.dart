import '../../domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel.fromJson(Map<String, dynamic> json)
      : super(
          cityName: json['name'],
          main: json['weather'][0]['main'],
          description: json['weather'][0]['description'],
          iconCode: json['weather'][0]['icon'],
          temperature: json['main']['temp'],
          pressure: json['main']['pressure'],
          humidity: json['main']['humidity'],
        );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': temperature,
          'pressure': pressure,
          'humidity': humidity,
        },
        'name': cityName,
      };
}
