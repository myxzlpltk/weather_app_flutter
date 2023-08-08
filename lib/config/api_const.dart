class ApiConst {
  ApiConst._();

  static const String apiBaseUrl = "https://api.open-meteo.com";

  static const String forecast = "$apiBaseUrl/v1/forecast";
  static const String forecastHourlyFeatures =
      "temperature_2m,relativehumidity_2m,precipitation_probability,weathercode,windspeed_10m";
}
