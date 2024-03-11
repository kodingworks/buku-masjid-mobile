import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'base_module.dart';

/// Class responsible for modularizing the application.
class Modular {
  static List<BaseModule> modulesX = [];

  /// Initialize the modular setup with the provided modules and dependency injector.
  ///
  /// This method should be called at the beginning of the application to set up all modules and dependencies.
  static Future<void> init(List<BaseModule> modules, GetIt sl) async {
    modulesX = modules;

    for (var item in modules) {
      await item.inject(sl);
    }
  }

  /// Define routes for the application based on the modules.
  static Route<dynamic> routes(RouteSettings settings) {
    // List all routes module
    final routeModules = <String, Route>{};

    for (var item in modulesX) {
      routeModules.addAll(item.routes(settings));
    }

    return routeModules['${settings.name}'] ??
        MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Page not found :('),
            ),
          );
        });
  }
}
