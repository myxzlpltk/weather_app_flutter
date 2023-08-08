import "package:flutter_bloc/flutter_bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:weather_flutter/di/injection.dart";
import "package:weather_flutter/domain/model/weather.dart";
import "package:weather_flutter/domain/repository/weather_repository.dart";

part "home_event.dart";

part "home_state.dart";

part "home_bloc.freezed.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepository weatherRepository = getIt.get();

  HomeBloc() : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
      );
    });
  }

  _started(_Started event, Emitter<HomeState> emit) async {
    try {
      final weathers = await weatherRepository.getCurrentWeather(
        0.0,
        0.0,
        "Asia/Jakarta",
      );
      print(weathers.length);
      print(weathers);
      if (weathers.isNotEmpty) {
        emit(HomeState.loaded(weathers.first));
      }
    } catch (e, st) {
      print(st);
      emit(const HomeState.error("Something Went Wrong!"));
    }
  }
}
