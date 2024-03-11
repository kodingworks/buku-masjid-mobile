import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:buku_masjid/core/core.dart';

import 'home.dart';

class HomeModule implements BaseModule {
  @override
  Future inject(GetIt getIt) async {
    // Data

    // Domain

    // Presentation
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    // final args = (settings.arguments ?? {}) as Map;
    return {
      MainPage.routeName: MaterialPageRoute(
        builder: (_) => const MainPage(),
        settings: settings,
      ),
    };
  }
}
