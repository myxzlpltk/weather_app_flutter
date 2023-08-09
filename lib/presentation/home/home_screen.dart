import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:weather_flutter/presentation/home/bloc/home_bloc.dart";
import "package:weather_flutter/presentation/home/component/weather_info_panel.dart";
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
                child: Column(
                  children: [
                    WeatherInfoSection(
                      weather: weather,
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white70,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: WeatherInfoPanel(
                                title: "Humidity",
                                metric: "${weather.humidity}%",
                              ),
                            ),
                            const VerticalDivider(width: 1),
                            Expanded(
                              child: WeatherInfoPanel(
                                title: "Wind Speed",
                                metric: "${weather.windSpeed} km/h",
                              ),
                            ),
                            const VerticalDivider(width: 1),
                            Expanded(
                              child: WeatherInfoPanel(
                                title: "Precipitation",
                                metric: "${weather.precipitationProbability}%",
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
