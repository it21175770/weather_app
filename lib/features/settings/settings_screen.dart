// lib/features/settings/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/providers/weather_provider.dart';



class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Use Fahrenheit instead of Celsius'),
            subtitle: Text('Current: ${provider.unitsLabel}'),
            value: provider.units == 'imperial',
            onChanged: (_) => provider.toggleUnits(),
          ),
        ],
      ),
    );
  }
}
