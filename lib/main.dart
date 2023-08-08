import "package:flutter/material.dart";
import "package:weather_flutter/di/injection.dart";
import "package:weather_flutter/my_app.dart";

void main() {
  configureDependencies();
  runApp(const MyApp());
}