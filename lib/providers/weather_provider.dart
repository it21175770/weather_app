// lib/providers/weather_provider.dart
import 'package:flutter/foundation.dart';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/utils/constants.dart';



class WeatherProvider extends ChangeNotifier {
  final WeatherService _service = WeatherService();

  Weather? _currentWeather;
  List<Weather> _forecast = [];
  bool _isLoading = false;
  String _selectedCity = AppConstants.defaultCity;
  String _units = 'metric'; // 'metric' or 'imperial'
  final List<String> _favoriteCities = [];

  Weather? get currentWeather => _currentWeather;
  List<Weather> get forecast => _forecast;
  bool get isLoading => _isLoading;
  String get selectedCity => _selectedCity;
  String get units => _units;
  List<String> get favoriteCities => List.unmodifiable(_favoriteCities);

  String get unitsLabel => _units == 'metric' ? '°C' : '°F';

  Future<void> loadInitial() async {
    await loadWeather(_selectedCity);
  }

  Future<void> loadWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      _selectedCity = city;
      _currentWeather = await _service.fetchCurrentWeather(city, units: _units);
      _forecast = await _service.fetchForecast(city, units: _units);
    } catch (e) {
      if (kDebugMode) {
        print('Error loading weather: $e');
      }
      _currentWeather = null;
      _forecast = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await loadWeather(_selectedCity);
  }

  void toggleUnits() {
    _units = _units == 'metric' ? 'imperial' : 'metric';
    loadWeather(_selectedCity);
  }

  void toggleFavorite(String city) {
    if (_favoriteCities.contains(city)) {
      _favoriteCities.remove(city);
    } else {
      _favoriteCities.add(city);
    }
    notifyListeners();
  }

  bool isFavorite(String city) => _favoriteCities.contains(city);
}
