import "package:flutter/material.dart";
import "package:weather_flutter/domain/model/weather.dart";

class WeatherInfoSection extends StatelessWidget {
  final Weather weather;

  const WeatherInfoSection({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
                child: Text(
                  weather.cityName.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 8, 16),
                child: Text(
                  "${weather.temperature}°",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
          child: RotatedBox(
            quarterTurns: -1,
            child: Text(
              weather.weatherStatus.description,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
