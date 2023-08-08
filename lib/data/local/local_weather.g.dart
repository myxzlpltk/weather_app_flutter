// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalWeatherAdapter extends TypeAdapter<LocalWeather> {
  @override
  final int typeId = 0;

  @override
  LocalWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalWeather()
      ..id = fields[0] as int
      ..weatherCode = fields[1] as int
      ..temperature = fields[2] as double
      ..humidity = fields[3] as int
      ..precipitationProbability = fields[4] as int
      ..windSpeed = fields[5] as double
      ..cityName = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, LocalWeather obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.weatherCode)
      ..writeByte(2)
      ..write(obj.temperature)
      ..writeByte(3)
      ..write(obj.humidity)
      ..writeByte(4)
      ..write(obj.precipitationProbability)
      ..writeByte(5)
      ..write(obj.windSpeed)
      ..writeByte(6)
      ..write(obj.cityName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
