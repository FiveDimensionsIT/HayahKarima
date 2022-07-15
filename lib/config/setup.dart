import 'package:get_it/get_it.dart';
import 'package:hayah_karema/config/app_config.dart';
import 'init_setup_di.dart';

bool demoMode = false;

void setupLiveMode(AppConfig config) {
  InitSetupDI.initServices();
  InitSetupDI.initManagers(config);
}

void setupDemoMode(AppConfig config) {
  InitSetupDI.initDemoMode(config);
}

/// Dependency Injection wrapper
abstract class DI {
  DI._();

  static void setSingleton<T extends Object>(T Function() creator) {
    GetIt.I.registerLazySingleton<T>(creator);
  }

  static void setFactory<T extends Object>(T Function() creator) {
    GetIt.I.registerFactory<T>(creator);
  }

  static void remove<T extends Object>() {
    GetIt.I.unregister<T>();
  }

  static T find<T extends Object>() {
    return GetIt.I.get<T>();
  }
}
