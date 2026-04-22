import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '3f6dd82e0cbc49ada18171019260702';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
      // Map<String, dynamic> weatherJsonMap = response.data;

      WeatherModel weatherInfo =
          WeatherModel.fromJson(response.data as Map<String, dynamic>);
      return weatherInfo;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "Opps, There was an error, try later";

      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Opps, There was an error, try later");
    }
  }
}
