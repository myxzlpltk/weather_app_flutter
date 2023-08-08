import "package:hive/hive.dart";

part "local_weather.g.dart";

@HiveType(typeId: 0)
class LocalWeather extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late int weatherCode;

  @HiveField(2)
  late double temperature;

  @HiveField(3)
  late int humidity;

  @HiveField(4)
  late int precipitationProbability;

  @HiveField(5)
  late double windSpeed;

  @HiveField(6)
  late String cityName;
}
