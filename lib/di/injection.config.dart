// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_flutter/data/local/weather_dao.dart' as _i4;
import 'package:weather_flutter/data/remote/weather_service.dart' as _i5;
import 'package:weather_flutter/data/repository/weather_repository_impl.dart'
    as _i7;
import 'package:weather_flutter/domain/repository/weather_repository.dart'
    as _i6;
import 'package:weather_flutter/domain/service/location_service.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LocationService>(() => _i3.LocationService());
    gh.factory<_i4.WeatherDAO>(() => _i4.WeatherDAO());
    gh.factory<_i5.WeatherService>(() => _i5.WeatherService());
    gh.factory<_i6.WeatherRepository>(() => _i7.WeatherRepositoryImpl(
          gh<_i5.WeatherService>(),
          gh<_i4.WeatherDAO>(),
        ));
    return this;
  }
}
