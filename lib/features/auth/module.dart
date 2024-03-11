import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:buku_masjid/core/core.dart';

import 'auth.dart';

class AuthModule implements BaseModule {
  @override
  Future inject(GetIt getIt) async {
    // Data
    getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(getIt()),
    );

    // Domain

    // Presentation
    getIt.registerFactory(() => AuthBloc());
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    // final args = (settings.arguments ?? {}) as Map;
    return {
      AuthPage.routeName: MaterialPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      ),
    };
  }
}
