// lib/models/weather_model.dart
class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final String icon;
  final double minTemp;
  final double maxTemp;
  final DateTime dateTime;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.minTemp,
    required this.maxTemp,
    required this.dateTime,
  });

  factory Weather.fromCurrentJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      minTemp: (json['main']['temp_min'] as num).toDouble(),
      maxTemp: (json['main']['temp_max'] as num).toDouble(),
      dateTime:
          DateTime.fromMillisecondsSinceEpoch((json['dt'] as int) * 1000, isUtc: true),
    );
  }

  factory Weather.fromForecastJson(
      Map<String, dynamic> json, String cityName) {
    return Weather(
      cityName: cityName,
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      minTemp: (json['main']['temp_min'] as num).toDouble(),
      maxTemp: (json['main']['temp_max'] as num).toDouble(),
      dateTime: DateTime.parse(json['dt_txt']),
    );
  }
}
