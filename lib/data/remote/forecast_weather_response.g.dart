// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWeatherResponse _$ForecastWeatherResponseFromJson(
        Map<String, dynamic> json) =>
    ForecastWeatherResponse(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      hourlyUnits:
          HourlyUnits.fromJson(json['hourly_units'] as Map<String, dynamic>),
      hourly: Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastWeatherResponseToJson(
        ForecastWeatherResponse instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezoneAbbreviation,
      'elevation': instance.elevation,
      'hourly_units': instance.hourlyUnits,
      'hourly': instance.hourly,
    };

HourlyUnits _$HourlyUnitsFromJson(Map<String, dynamic> json) => HourlyUnits(
      time: json['time'] as String,
      temperature2m: json['temperature_2m'] as String,
      relativehumidity2m: json['relativehumidity_2m'] as String,
      precipitationProbability: json['precipitation_probability'] as String,
      weathercode: json['weathercode'] as String,
      windspeed10m: json['windspeed_10m'] as String,
    );

Map<String, dynamic> _$HourlyUnitsToJson(HourlyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature2m,
      'relativehumidity_2m': instance.relativehumidity2m,
      'precipitation_probability': instance.precipitationProbability,
      'weathercode': instance.weathercode,
      'windspeed_10m': instance.windspeed10m,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      time: (json['time'] as List<dynamic>).map((e) => e as int).toList(),
      temperature2m: (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      relativehumidity2m: (json['relativehumidity_2m'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      precipitationProbability:
          (json['precipitation_probability'] as List<dynamic>)
              .map((e) => e as int)
              .toList(),
      weathercode:
          (json['weathercode'] as List<dynamic>).map((e) => e as int).toList(),
      windspeed10m: (json['windspeed_10m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature2m,
      'relativehumidity_2m': instance.relativehumidity2m,
      'precipitation_probability': instance.precipitationProbability,
      'weathercode': instance.weathercode,
      'windspeed_10m': instance.windspeed10m,
    };
