import "dart:convert";

import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";
import "package:weather_flutter/config/api_const.dart";
import "package:weather_flutter/data/ext/weather_ext.dart";
import "package:weather_flutter/data/remote/forecast_weather_response.dart";
import "package:weather_flutter/domain/model/weather.dart";

@injectable
class WeatherService {
  Future<List<Weather>> fetch(
    String cityName,
    double latitude,
    double longitude,
    String timezone,
  ) async {
    var uri = Uri.parse(ApiConst.forecast).replace(queryParameters: {
      "hourly": ApiConst.forecastHourlyFeatures,
      "timeformat": "unixtime",
      "latitude": latitude.toString(),
      "longitude": longitude.toString(),
      "timezone": timezone,
    });
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var forecast = ForecastWeatherResponse.fromJson(json);

      return forecast.toWeatherList(cityName);
    } else {
      throw Exception("Failed to fetch forecast API");
    }
  }
}
