import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_timezone/flutter_timezone.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:weather_flutter/di/injection.dart";
import "package:weather_flutter/domain/model/weather.dart";
import "package:weather_flutter/domain/repository/weather_repository.dart";
import "package:weather_flutter/domain/service/location_service.dart";
import "package:weather_flutter/logger.dart";

part "home_bloc.freezed.dart";
part "home_event.dart";
part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepository weatherRepository = getIt.get();
  final LocationService locationService = getIt.get();

  HomeBloc() : super(const HomeState.initial()) {
    weatherRepository.getCurrentWeather().listen((weather) {
      add(HomeEvent.setWeather(weather));
    });

    on<HomeEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        setWeather: (event) => _setWeather(event, emit),
      );
    });
  }

  _started(_Started event, Emitter<HomeState> emit) async {
    try {
      final timezone = await FlutterTimezone.getLocalTimezone();
      final position = await locationService.determinePosition();
      final cityName = await locationService.getCityName(position);
      await weatherRepository.fetchForecast(
        cityName,
        position.latitude,
        position.longitude,
        timezone,
      );
    } catch (e, st) {
      logger.e(e, stackTrace: st);
    }
  }

  _setWeather(_SetWeather event, Emitter<HomeState> emit) {
    var weather = event.weather;

    if (weather == null) {
      add(const HomeEvent.started());
      emit(const HomeState.error("Empty data!"));
    } else {
      emit(HomeState.loaded(weather));
    }
  }
}
