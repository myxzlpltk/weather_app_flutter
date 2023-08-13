import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:weather_flutter/presentation/home/component/weather_info.dart";
import "package:weather_flutter/presentation/home/home_controller.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: controller.obx(
        (weather) => weather != null
            ? WeatherInfo(weather: weather)
            : const Center(child: Text("Empty data")),
        onEmpty: const Center(child: Text("Empty data")),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(
          child: Text(error ?? "Something went wrong"),
        ),
      ),
    );
  }
}
