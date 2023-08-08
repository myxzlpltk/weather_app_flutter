import "package:weather_flutter/data/remote/forecast_weather_response.dart";
import "package:weather_flutter/domain/model/weather.dart";
import "package:weather_flutter/domain/model/weather_status.dart";

extension ForecastWeatherResponseExt on ForecastWeatherResponse {
  List<Weather> toWeatherList() {
    List.generate(
      hourly.time.length,
      (i) => Weather(
        hourly.time[i],
        hourly.weathercode[i],
        WeatherStatus.fromCode(hourly.weathercode[i]),
        hourly.temperature2m[i],
        hourly.relativehumidity2m[i],
        hourly.precipitationProbability[i],
        hourly.windspeed10m[i],
        "City Name",
      ),
    );
    return [];
  }
}
