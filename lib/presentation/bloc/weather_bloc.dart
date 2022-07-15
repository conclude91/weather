import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/models/weather_model.dart';
import '../../domain/usecases/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._getWeatherUsecase) : super(WeatherInitialState()) {
    on<OnCityChanged>(_onCityChanged, transformer: debounce(_duration));
  }

  final GetWeatherUsecase _getWeatherUsecase;

  void _onCityChanged(OnCityChanged event, Emitter<WeatherState> emit) async {
    final cityName = event.cityName;

    emit(WeatherLoadingState());

    try {
      final weatherModel = await _getWeatherUsecase.call(cityName);
      emit(WeatherLoadedState(weatherModel));
    } catch (error) {
      emit(WeatherErrorState(error.toString()));
    }
  }
}
