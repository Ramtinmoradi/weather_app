import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/color.dart';

import 'service/determine_position_service.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc()
                ..add(
                  FetchWeatherEvent(
                    snapshot.data as Position,
                  ),
                ),
              child: const HomeScreen(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: MainColor.searchBoxFontColor,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
