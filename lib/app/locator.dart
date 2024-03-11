import 'package:buku_masjid/core/core.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';

import 'config.dart';
import 'modules.dart';

/// Global instance of GetIt service locator.
final getIt = GetIt.instance;

/// Asynchronously sets up the service locator with dependencies.
Future<void> setupLocator() async {
  await _setupCore();

  await Modular.init(appModules, GetIt.instance);
}

/// Asynchronously sets up the core dependencies.
Future<void> _setupCore() async {
  EquatableConfig.stringify = AppConfig.autoStringifyEquatable;

  getIt.registerLazySingleton(InternetConnectionChecker.new);
  getIt.registerLazySingleton(
    () => CaptureErrorUseCase(),
  );
  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(baseUrl: AppConfig.baseUrl.value)
      ..interceptors.addAll([
        LogInterceptor(requestBody: true, responseBody: true),
        AuthHttpInterceptor(getIt()),
      ]),
  );

  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
  }

  getIt.registerLazySingleton<HiveInterface>(() => Hive);

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );
}
