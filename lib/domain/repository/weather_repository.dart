import "package:weather_flutter/domain/model/weather.dart";

abstract class WeatherRepository {
  Future<void> fetchForecast(
    String cityName,
    double latitude,
    double longitude,
    String timezone,
  );

  Stream<Weather?> getCurrentWeather();
}
