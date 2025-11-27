// lib/widgets/weather_card.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/models/weather_model.dart';



class WeatherCard extends StatelessWidget {
  final Weather weather;
  final String unitsLabel;
  final bool showDate;

  const WeatherCard({
    super.key,
    required this.weather,
    required this.unitsLabel,
    this.showDate = false,
  });

  @override
  Widget build(BuildContext context) {
    final dateText = DateFormat('EEE, dd MMM – HH:mm').format(weather.dateTime);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Weather icon
            Image.network(
              'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
              width: 60,
              height: 60,
              errorBuilder: (_, __, ___) => const Icon(Icons.cloud),
            ),
            const SizedBox(width: 12),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showDate) Text(dateText,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                  Text(
                    '${weather.temperature.toStringAsFixed(1)} $unitsLabel',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    weather.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Min: ${weather.minTemp.toStringAsFixed(0)}  Max: ${weather.maxTemp.toStringAsFixed(0)} $unitsLabel',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
