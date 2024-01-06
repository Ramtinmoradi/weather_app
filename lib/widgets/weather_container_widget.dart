import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/data/weather_data.dart';
import 'package:weather_app/service/weather_service.dart';

import '/constants/color.dart';

class WeatherContainerWidget extends StatefulWidget {
  const WeatherContainerWidget({super.key});

  @override
  State<WeatherContainerWidget> createState() => _WeatherContainerWidgetState();
}

class _WeatherContainerWidgetState extends State<WeatherContainerWidget> {
  final _weatherService = WeatherService('3d1b0f242e9d24d04a847b3406379973');
  WeatherData? _weatherData;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    //String cityName = 'Tehran';

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weatherData = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  LinearGradient _getWeatherContainerColor(String? mainCondition) {
    if (mainCondition == null) return MainGradientColor.defaultWeatherGradient;

    switch (mainCondition.toLowerCase()) {
      case 'fog':
      case 'mist':
        return MainGradientColor.mistWeatherGradient;
      case 'clouds':
      case 'smoke':
      case 'haze':
      case 'dust':
        return MainGradientColor.cloudsWeatherGradient;
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return MainGradientColor.rainWeatherGradient;
      case 'snow':
        return MainGradientColor.snowWeatherGradient;
      case 'thunderstorm':
        return MainGradientColor.thunderstormWeatherGradient;
      case 'clear':
        return MainGradientColor.sunnyWeatherGradient;
      default:
        return MainGradientColor.defaultWeatherGradient;
    }
  }

  String _getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/lottie/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'fog':
      case 'mist':
        return 'assets/lottie/misty.json';
      case 'clouds':
      case 'smoke':
      case 'haze':
      case 'dust':
        return 'assets/lottie/clouds.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/lottie/rain.json';
      case 'snow':
        return 'assets/lottie/snow.json';
      case 'thunderstorm':
        return 'assets/lottie/thunderstorm.json';
      case 'clear':
        return 'assets/lottie/sunny.json';
      default:
        return 'assets/lottie/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 127.0,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: _getWeatherContainerColor(_weatherData?.mainCondition),
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 75.0,
            child: Text(
              _weatherData?.temperature.toString() ?? '',
              style: GoogleFonts.montserrat(
                letterSpacing: 1.1,
                color: MainColor.backgroundColor,
                fontSize: 50.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/svg/degree.svg'),
              const SizedBox(height: 30.0),
            ],
          ),
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _weatherData?.mainCondition ?? '',
                style: GoogleFonts.montserrat(
                  color: MainColor.backgroundColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset('assets/svg/location_icon.svg'),
                  const SizedBox(width: 8.0),
                  Text(
                    _weatherData?.cityName ?? 'Loading city name',
                    style: GoogleFonts.montserrat(
                      color: MainColor.backgroundColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 60.0,
            height: 60.0,
            child: Lottie.asset(
              _getWeatherAnimation(_weatherData?.mainCondition),
            ),
          )
        ],
      ),
    );
  }
}
