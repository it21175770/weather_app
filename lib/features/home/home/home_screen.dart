// lib/features/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/loading_widget.dart';
import 'package:weather_app/widgets/weather_card.dart';
import 'package:weather_app/features/favorites/favorites_screen.dart';
import 'package:weather_app/features/forecast/forecast_screen.dart';
import 'package:weather_app/features/search/search_screen.dart';
import 'package:weather_app/features/settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.selectedCity),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: provider.refresh,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                'Weather App',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Forecast'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ForecastScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FavoritesScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () async {
          final resultCity = await Navigator.push<String?>(
            context,
            MaterialPageRoute(builder: (_) => const SearchScreen()),
          );
          if (resultCity != null && resultCity.isNotEmpty) {
            provider.loadWeather(resultCity);
          }
        },
      ),
      body: provider.isLoading
          ? const LoadingWidget(message: 'Loading weather...')
          : provider.currentWeather == null
              ? const Center(child: Text('No data. Try searching a city.'))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Simple weather icon instead of Lottie animation
                      const SizedBox(height: 16),
                      const Icon(
                        Icons.cloud,
                        size: 100,
                      ),
                      const SizedBox(height: 16),

                      // City name
                      Text(
                        provider.currentWeather!.cityName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Temperature
                      Text(
                        '${provider.currentWeather!.temperature.toStringAsFixed(1)} ${provider.unitsLabel}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(height: 8),

                      // Description
                      Text(
                        provider.currentWeather!.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),

                      // Favorites toggle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              provider.isFavorite(
                                      provider.currentWeather!.cityName)
                                  ? Icons.star
                                  : Icons.star_border,
                            ),
                            onPressed: () {
                              provider.toggleFavorite(
                                  provider.currentWeather!.cityName);
                            },
                          ),
                          const SizedBox(width: 8),
                          Text(
                            provider.isFavorite(
                                    provider.currentWeather!.cityName)
                                ? 'Remove from favorites'
                                : 'Add to favorites',
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Upcoming forecast',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      SizedBox(
                        height: 190, // a bit taller to avoid overflow
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.forecast.length.clamp(0, 10),
                          itemBuilder: (context, index) {
                            final item = provider.forecast[index];
                            return SizedBox(
                              width: 200,
                              child: WeatherCard(
                                weather: item,
                                unitsLabel: provider.unitsLabel,
                                showDate: true,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
