part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  const WeatherLoadedState(this.weatherModel);

  final WeatherModel weatherModel;

  @override
  List<Object> get props => [weatherModel];
}

class WeatherErrorState extends WeatherState {
  const WeatherErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
