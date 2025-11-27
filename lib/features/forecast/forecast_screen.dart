// lib/features/forecast/forecast_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/weather_card.dart';



class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Forecast - ${provider.selectedCity}'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: provider.forecast.length,
        itemBuilder: (context, index) {
          final item = provider.forecast[index];
          return WeatherCard(
            weather: item,
            unitsLabel: provider.unitsLabel,
            showDate: true,
          );
        },
      ),
    );
  }
}
