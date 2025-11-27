// lib/features/favorites/favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/providers/weather_provider.dart';



class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();
    final favorites = provider.favoriteCities;

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Cities')),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites yet.'))
          : ListView.separated(
              itemCount: favorites.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final city = favorites[index];
                return ListTile(
                  leading: const Icon(Icons.location_city),
                  title: Text(city),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      provider.toggleFavorite(city);
                    },
                  ),
                  onTap: () {
                    provider.loadWeather(city);
                    Navigator.pop(context);
                  },
                );
              },
            ),
    );
  }
}
