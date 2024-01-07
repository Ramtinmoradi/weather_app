part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitialState extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherFailureState extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  final Weather weather;

  const WeatherSuccessState(this.weather);

  @override
  List<Object> get props => [weather];
}