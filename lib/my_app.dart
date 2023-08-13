import "package:flutter/material.dart";
import "package:weather_flutter/color_schemes.g.dart";
import "package:weather_flutter/presentation/home/home_screen.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
