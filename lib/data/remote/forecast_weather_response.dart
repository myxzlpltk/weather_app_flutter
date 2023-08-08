import "package:json_annotation/json_annotation.dart";

part "forecast_weather_response.g.dart";

@JsonSerializable()
class ForecastWeatherResponse {
  final double latitude;
  final double longitude;
  @JsonKey(name: "generationtime_ms")
  final double generationtimeMs;
  @JsonKey(name: "utc_offset_seconds")
  final int utcOffsetSeconds;
  final String timezone;
  @JsonKey(name: "timezone_abbreviation")
  final String timezoneAbbreviation;
  final double elevation;
  @JsonKey(name: "hourly_units")
  final HourlyUnits hourlyUnits;
  final Hourly hourly;

  const ForecastWeatherResponse({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
  });

  factory ForecastWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeatherResponseFromJson(json);
}

@JsonSerializable()
class HourlyUnits {
  final String time;
  @JsonKey(name: "temperature_2m")
  final String temperature2m;
  @JsonKey(name: "relativehumidity_2m")
  final String relativehumidity2m;
  @JsonKey(name: "precipitation_probability")
  final String precipitationProbability;
  final String weathercode;
  @JsonKey(name: "windspeed_10m")
  final String windspeed10m;

  const HourlyUnits({
    required this.time,
    required this.temperature2m,
    required this.relativehumidity2m,
    required this.precipitationProbability,
    required this.weathercode,
    required this.windspeed10m,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) =>
      _$HourlyUnitsFromJson(json);
}

@JsonSerializable()
class Hourly {
  final List<int> time;
  @JsonKey(name: "temperature_2m")
  final List<double> temperature2m;
  @JsonKey(name: "relativehumidity_2m")
  final List<int> relativehumidity2m;
  @JsonKey(name: "precipitation_probability")
  final List<int> precipitationProbability;
  final List<int> weathercode;
  @JsonKey(name: "windspeed_10m")
  final List<double> windspeed10m;

  const Hourly({
    required this.time,
    required this.temperature2m,
    required this.relativehumidity2m,
    required this.precipitationProbability,
    required this.weathercode,
    required this.windspeed10m,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) =>
      _$HourlyFromJson(json);
}
