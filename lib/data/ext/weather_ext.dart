import "package:weather_flutter/data/local/local_weather.dart";
import "package:weather_flutter/data/remote/forecast_weather_response.dart";
import "package:weather_flutter/domain/model/weather.dart";
import "package:weather_flutter/domain/model/weather_status.dart";

extension ForecastWeatherResponseExt on ForecastWeatherResponse {
  List<Weather> toWeatherList(String cityName) {
    return List.generate(
      hourly.time.length,
      (i) => Weather(
        hourly.time[i],
        hourly.weathercode[i],
        WeatherStatus.fromCode(hourly.weathercode[i]),
        hourly.temperature2m[i],
        hourly.relativehumidity2m[i],
        hourly.precipitationProbability[i],
        hourly.windspeed10m[i],
        cityName,
      ),
    );
  }
}

extension WeatherExt on Weather {
  LocalWeather toLocal() {
    return LocalWeather()
      ..id = id
      ..weatherCode = weatherCode
      ..temperature = temperature
      ..humidity = humidity
      ..precipitationProbability = precipitationProbability
      ..windSpeed = windSpeed
      ..cityName = cityName;
  }
}

extension LocalWeatherExt on LocalWeather {
  Weather toDomain() {
    return Weather(
      id,
      weatherCode,
      WeatherStatus.fromCode(weatherCode),
      temperature,
      humidity,
      precipitationProbability,
      windSpeed,
      cityName,
    );
  }
}
