import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:weather_flutter/presentation/home/bloc/home_bloc.dart";
import "package:weather_flutter/presentation/home/component/weather_info_section.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc()..add(const HomeEvent.started()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (message) => Center(
              child: Text(message),
            ),
            loaded: (weather) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(weather.weatherStatus.image),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25),
                    BlendMode.srcATop,
                  ),
                ),
              ),
              child: SafeArea(
                child: WeatherInfoSection(
                  weather: weather,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
