import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:weather_flutter/presentation/home/bloc/home_bloc.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: HomeBloc()..add(const HomeEvent.started()),
      builder: (context, state) => Scaffold(
        body: state.when(
          initial: () => const Text("Loading..."),
          loaded: (weather) => Text(weather.cityName),
          error: (message) => Text(message),
        ),
      ),
    );
  }
}
