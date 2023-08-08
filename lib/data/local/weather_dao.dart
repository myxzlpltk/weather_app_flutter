import "package:hive_flutter/hive_flutter.dart";
import "package:injectable/injectable.dart";
import "package:weather_flutter/data/local/local_weather.dart";

@injectable
class WeatherDAO {
  void insertAll(List<LocalWeather> weathers) async {
    var box = await Hive.openBox<LocalWeather>("weathers");
    await Future.wait(weathers.map((weather) => box.put(weather.id, weather)));
    await box.close();
  }

  Future<LocalWeather?> get(int key) async {
    var box = await Hive.openBox<LocalWeather>("weathers");
    var localWeather = box.get(key);
    await box.close();

    return localWeather;
  }

  void clearAll() async {
    var box = await Hive.openBox<LocalWeather>("weathers");
    await box.clear();
    await box.close();
  }
}
