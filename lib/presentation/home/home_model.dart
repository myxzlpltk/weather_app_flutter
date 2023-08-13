import "package:flutter/material.dart";
import "package:flutter_timezone/flutter_timezone.dart";
import "package:weather_flutter/di/injection.dart";
import "package:weather_flutter/domain/model/weather.dart";
import "package:weather_flutter/domain/repository/weather_repository.dart";
import "package:weather_flutter/domain/service/location_service.dart";
import "package:weather_flutter/logger.dart";

class HomeModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository = getIt.get();
  final LocationService _locationService = getIt.get();

  Weather? weather;
  String? errorMessage;

  HomeModel() {
    fetchForecast();
    _weatherRepository.getCurrentWeather().listen((weather) {
      _setWeather(weather);
    });
  }

  void fetchForecast() async {
    try {
      final timezone = await FlutterTimezone.getLocalTimezone();
      final position = await _locationService.determinePosition();
      final cityName = await _locationService.getCityName(position);
      await _weatherRepository.fetchForecast(
        cityName,
        position.latitude,
        position.longitude,
        timezone,
      );
    } catch (e, st) {
      errorMessage = "Failed to fetch weather";
      notifyListeners();
      logger.e(e, stackTrace: st);
    }
  }

  void _setWeather(Weather? updateWeather) {
    if (updateWeather == null) {
      errorMessage = "Weather is empty.";
    } else {
      weather = updateWeather;
    }
    notifyListeners();
  }
}