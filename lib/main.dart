import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:weather_flutter/data/local/local_weather.dart";
import "package:weather_flutter/di/injection.dart";
import "package:weather_flutter/my_app.dart";

void main() async {
  // Initialize HiveDB
  await Hive.initFlutter();
  Hive.registerAdapter(LocalWeatherAdapter());

  // Configure dependencies injection
  configureDependencies();

  // Run Flutter App
  runApp(const MyApp());
}
