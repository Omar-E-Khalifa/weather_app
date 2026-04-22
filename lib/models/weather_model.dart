class WeatherModel {
  final String cityName;
  final double maxTemp;
  final double minTemp;
  final double currentTemp;
  final String condition;
  final String? image;
  final DateTime dateUpdated;

  WeatherModel({
    required this.cityName,
    required this.currentTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    this.image,
    required this.dateUpdated,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      currentTemp: json["current"]["temp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      condition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      dateUpdated: DateTime.parse(json["current"]["last_updated"]),
    );
  }
}
