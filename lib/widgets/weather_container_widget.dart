import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';

import '/constants/color.dart';

class WeatherContainerWidget extends StatefulWidget {
  const WeatherContainerWidget({super.key});

  @override
  State<WeatherContainerWidget> createState() => _WeatherContainerWidgetState();
}

class _WeatherContainerWidgetState extends State<WeatherContainerWidget> {
  String _getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/lottie/loader.json';

    switch (mainCondition.toLowerCase()) {
      case 'fog':
      case 'mist':
      case 'overcast':
        return 'assets/lottie/misty.json';
      case 'partly cloudy':
      case 'cloud':
      case 'smoke':
      case 'haze':
      case 'dust':
        return 'assets/lottie/clouds.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/lottie/rain.json';
      case 'snow':
      case 'light snow':
        return 'assets/lottie/snow.json';
      case 'thunderstorm':
        return 'assets/lottie/thunderstorm.json';
      case 'clear':
        return 'assets/lottie/sunny.json';
      default:
        return 'assets/lottie/sunny.json';
    }
  }

  LinearGradient _getDayTimeGradient(String time) {
    switch (time) {
      case '00':
      case '01':
      case '02':
      case '03':
      case '04':
      case '05':
      case '06':
      case '18':
      case '19':
      case '20':
      case '21':
      case '22':
      case '23':
        return MainGradientColor.nightGradient;
      default:
        return MainGradientColor.dayGradient;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccessState) {
          return Container(
            width: double.infinity,
            height: 127.0,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: _getDayTimeGradient(state.weather.date.toString()),
              borderRadius: const BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 100.0,
                  height: 70.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '${state.weather.temperature!.celsius!.round()}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          letterSpacing: 1.1,
                          color: MainColor.backgroundColor,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          '°',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            letterSpacing: 1.1,
                            color: MainColor.backgroundColor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'C',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            letterSpacing: 1.1,
                            color: MainColor.backgroundColor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      state.weather.weatherMain!.toUpperCase(),
                      style: GoogleFonts.montserrat(
                        letterSpacing: 1.5,
                        color: MainColor.backgroundColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset('assets/svg/location_icon.svg'),
                        const SizedBox(width: 8.0),
                        Text(
                          state.weather.areaName!.toUpperCase(),
                          style: GoogleFonts.montserrat(
                            letterSpacing: 1.5,
                            color: MainColor.backgroundColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
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
                    _getWeatherAnimation(state.weather.areaName),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: MainColor.searchBoxFontColor,
            ),
          );
        }
      },
    );
  }
}
