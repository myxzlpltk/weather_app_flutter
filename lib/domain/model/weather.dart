import "package:weather_flutter/domain/model/weather_status.dart";

class Weather {
  final int id;
  final int weatherCode;
  final WeatherStatus weatherStatus;
  final double temperature;
  final int humidity;
  final int precipitationProbability;
  final double windSpeed;
  final String cityName;

  Weather(
    this.id,
    this.weatherCode,
    this.weatherStatus,
    this.temperature,
    this.humidity,
    this.precipitationProbability,
    this.windSpeed,
    this.cityName,
  );
}
