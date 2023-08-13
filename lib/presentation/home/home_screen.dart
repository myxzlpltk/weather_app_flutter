import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:weather_flutter/presentation/home/component/weather_info.dart";
import "package:weather_flutter/presentation/home/home_model.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: Scaffold(
        body: Consumer<HomeModel>(
          builder: (context, cartModel, _) {
            var errorMessage = cartModel.errorMessage;
            var weather = cartModel.weather;

            if (errorMessage != null) {
              return Center(child: Text(errorMessage));
            } else if (weather != null) {
              return WeatherInfo(weather: weather);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
