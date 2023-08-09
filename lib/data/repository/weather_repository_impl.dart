import "package:injectable/injectable.dart";
import "package:weather_flutter/data/ext/weather_ext.dart";
import "package:weather_flutter/data/local/weather_dao.dart";
import "package:weather_flutter/data/remote/weather_service.dart";
import "package:weather_flutter/domain/model/weather.dart";
import "package:weather_flutter/domain/repository/weather_repository.dart";

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherService weatherService;
  final WeatherDAO weatherDAO;

  WeatherRepositoryImpl(this.weatherService, this.weatherDAO);

  @override
  Future<void> fetchForecast(
    String cityName,
    double latitude,
    double longitude,
    String timezone,
  ) async {
    // Fetch network
    var weathers = await weatherService.fetch(
      cityName,
      latitude,
      longitude,
      timezone,
    );

    // Sync to local
    var localWeathers = weathers.map((e) => e.toLocal()).toList();
    await weatherDAO.clearAll();
    await weatherDAO.insertAll(localWeathers);
  }

  @override
  Stream<Weather?> getCurrentWeather() async* {
    yield await _getCurrentWeather();
    yield* Stream.periodic(
      const Duration(minutes: 1),
      (i) => _getCurrentWeather(),
    ).asyncMap((event) async => await event);
  }

  Future<Weather?> _getCurrentWeather() {
    var time = DateTime.now().copyWith(
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    var key = time.millisecondsSinceEpoch ~/ 1000;

    return weatherDAO.get(key).then((e) => e?.toDomain());
  }
}
