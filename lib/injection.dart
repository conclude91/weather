import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/remote/weather_remote_datasource.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/repositories/weather_repository.dart';
import 'domain/usecases/get_weather_usecase.dart';
import 'presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance; // sl refer to service locator

Future<void> init() async {
  // bloc
  sl.registerFactory(() => WeatherBloc(sl()));

  // usecases
  sl.registerLazySingleton(() => GetWeatherUsecase(sl()));

  // repositories
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherRemoteDataSource: sl()));

  // datasources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: sl()));

  // external
  sl.registerLazySingleton(() => http.Client());
}
