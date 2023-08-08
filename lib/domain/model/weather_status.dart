enum WeatherStatus {
  clearSky([0], "Clear Sky", "clear_sky"),
  cloudy([1, 2, 3], "Cloudy", "cloudy"),
  foggy([45, 48], "Foggy", "foggy"),
  drizzle([51, 53, 55], "Drizzle", "drizzle"),
  freezingDrizzle([56, 57], "Freezing Drizzle", "freezing_drizzle"),
  rain([61, 63, 65], "Rain", "rain"),
  freezingRain([66, 67], "Freezing Rain", "freezing_rain"),
  snow([71, 73, 75], "Snow", "snow"),
  snowGrains([77], "Snow Grains", "snow_grains"),
  rainShowers([80, 81, 82], "Rain Showers", "rain_showers"),
  snowShowers([85, 86], "Snow Showers", "snow_showers"),
  thunderstorm([95], "Thunderstorm", "thunderstorm"),
  thunderstormHail([96, 99], "Thunderstorm Hail", "thunderstorm_hail"),
  unknown([-1], "Unknown", "unknown");

  const WeatherStatus(
    this.codes,
    this.description,
    this.fileName,
  );

  final List<int> codes;
  final String description;
  final String fileName;

  String get image => "assets/$fileName.webp";

  static WeatherStatus fromCode(int code) {
    return WeatherStatus.values.firstWhere(
      (e) => e.codes.contains(code),
      orElse: () => WeatherStatus.unknown,
    );
  }
}
