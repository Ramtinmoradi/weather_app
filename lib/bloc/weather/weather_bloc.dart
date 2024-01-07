import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

import '/data/my_data.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        WeatherFactory weatherFactory = WeatherFactory(
          API_KEY,
          language: Language.ENGLISH,
        );

        Weather weather = await weatherFactory.currentWeatherByCityName('Tehran');

        emit(WeatherSuccessState(weather));
      } catch (exception) {
        emit(WeatherFailureState());
      }
    });
  }
}
