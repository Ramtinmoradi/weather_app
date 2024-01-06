class WeatherData {
  final String? cityName;
  final int? temperature;
  final String? mainCondition;
  final String? mainConditionIcon;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.mainConditionIcon,
  });

  factory WeatherData.mapFromJson(Map<String, dynamic> mapFromJson) {
    return WeatherData(
      cityName: mapFromJson['location']['name'],
      temperature: mapFromJson['current']['temperature'],
      mainCondition: mapFromJson['current']['weather_descriptions'][0],
      mainConditionIcon: mapFromJson['current']['weather_icons'][0],
    );
  }
}
