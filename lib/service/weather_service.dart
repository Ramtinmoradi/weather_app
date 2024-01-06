import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '/data/weather_data.dart';

class WeatherService {
  static const BASE_URL = 'http://api.weatherstack.com';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<WeatherData> getWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$BASE_URL/current?access_key=$apiKey&query=$cityName'),
    );

    if (response.statusCode == 200) {
      return WeatherData.mapFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission _permission = await Geolocator.checkPermission();

    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
    }

    Position _position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> _placeMarks = await placemarkFromCoordinates(
      _position.latitude,
      _position.longitude,
    );

    String? city = _placeMarks[0].locality;

    return city ?? '';
  }
}
