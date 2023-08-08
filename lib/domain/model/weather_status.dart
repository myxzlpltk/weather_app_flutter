enum WeatherStatus {
  clearSky([0], "clear_sky", "clear_sky"),
  cloudy([1, 2, 3], "cloudy", "cloudy"),
  foggy([45, 48], "foggy", "foggy"),
  drizzle([51, 53, 55], "drizzle", "drizzle"),
  freezingDrizzle([56, 57], "freezing_drizzle", "freezing_drizzle"),
  rain([61, 63, 65], "rain", "rain"),
  freezingRain([66, 67], "freezing_rain", "freezing_rain"),
  snow([71, 73, 75], "snow", "snow"),
  snowGrains([77], "snow_grains", "snow_grains"),
  rainShowers([80, 81, 82], "rain_showers", "rain_showers"),
  snowShowers([85, 86], "snow_showers", "snow_showers"),
  thunderstorm([95], "thunderstorm", "thunderstorm"),
  thunderstormHail([96, 99], "thunderstorm_hail", "thunderstorm_hail"),
  unknown([-1], "unknown", "unknown");

  const WeatherStatus(
    this.codes,
    this.description,
    this.image,
  );

  final List<int> codes;
  final String description;
  final String image;

  static WeatherStatus fromCode(int code) {
    return WeatherStatus.values.firstWhere(
      (e) => e.codes.contains(code),
      orElse: () => WeatherStatus.unknown,
    );
  }
}
