import "package:weather_flutter/domain/model/weather.dart";

abstract class WeatherRepository {
  Future<List<Weather>> getCurrentWeather(
    double latitude,
    double longitude,
    String timezone,
  );
}
