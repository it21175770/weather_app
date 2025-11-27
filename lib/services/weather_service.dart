// lib/services/weather_service.dart
import 'package:dio/dio.dart';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/constants.dart';



class WeatherService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Weather> fetchCurrentWeather(String city, {String units = 'metric'}) async {
    final response = await _dio.get(
      '/weather',
      queryParameters: {
        'q': city,
        'appid': AppConstants.apiKey,
        'units': units,
      },
    );

    return Weather.fromCurrentJson(response.data);
  }

  Future<List<Weather>> fetchForecast(String city,
      {String units = 'metric'}) async {
    final response = await _dio.get(
      '/forecast',
      queryParameters: {
        'q': city,
        'appid': AppConstants.apiKey,
        'units': units,
      },
    );

    final cityName = response.data['city']['name'];
    final List list = response.data['list'];

    return list
        .map((item) => Weather.fromForecastJson(item, cityName))
        .toList();
  }
}
