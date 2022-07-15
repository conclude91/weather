import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart' as di; // dependency injector
import 'presentation/bloc/weather_bloc.dart';
import 'presentation/screens/weather_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // inject all dependecies and wait for it is done
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<WeatherBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(primarySwatch: Colors.orange),
        home: const WeatherScreen(),
      ),
    );
  }
}
