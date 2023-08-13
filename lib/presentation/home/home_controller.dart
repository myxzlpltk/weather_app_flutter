import "package:flutter_timezone/flutter_timezone.dart";
import "package:get/get.dart";
import "package:weather_flutter/di/injection.dart";
import "package:weather_flutter/domain/model/weather.dart";
import "package:weather_flutter/domain/repository/weather_repository.dart";
import "package:weather_flutter/domain/service/location_service.dart";
import "package:weather_flutter/logger.dart";

class HomeController extends GetxController with StateMixin<Weather> {
  final WeatherRepository _weatherRepository = getIt.get();
  final LocationService _locationService = getIt.get();

  HomeController() {
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
      change(null, status: RxStatus.error("Failed to fetch weather"));
      logger.e(e, stackTrace: st);
    }
  }

  void _setWeather(Weather? weather) {
    if (weather == null) {
      change(null, status: RxStatus.empty());
    } else {
      change(weather, status: RxStatus.success());
    }
  }
}
