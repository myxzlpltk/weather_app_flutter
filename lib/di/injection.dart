import "package:get_it/get_it.dart";
import "package:injectable/injectable.dart";
import "package:weather_flutter/di/injection.config.dart";

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: "init",
  preferRelativeImports: false,
  asExtension: true,
)
void configureDependencies() => getIt.init();