import "package:injectable/injectable.dart";
import "package:weather_flutter/data/remote/weather_service.dart";
import "package:weather_flutter/domain/model/weather.dart";
import "package:weather_flutter/domain/repository/weather_repository.dart";

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService weatherService;

  WeatherRepositoryImpl(this.weatherService);

  @override
  Future<List<Weather>> getCurrentWeather(
    double latitude,
    double longitude,
    String timezone,
  ) async {
    return await weatherService.fetch(latitude, longitude, timezone);
  }
}
