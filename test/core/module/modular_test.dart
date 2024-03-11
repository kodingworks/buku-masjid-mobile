import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:buku_masjid/core/module/module.dart';

class TestModule extends BaseModule {
  @override
  Map<String, Route> routes(RouteSettings settings) {
    return {'/home': MaterialPageRoute(builder: (_) => const Scaffold())};
  }

  @override
  Future<void> inject(GetIt getIt) async {}
}

void main() {
  testWidgets('Modular init should register modules and inject dependencies',
      (WidgetTester tester) async {
    // Arrange
    final testModule = TestModule();
    final getIt = GetIt.instance;

    // Act
    await Modular.init([testModule], getIt);

    // Assert
    expect(Modular.modulesX.length, 1);
    expect(getIt.isRegistered<TestModule>(), false);
  });

  testWidgets('Modular routes should return correct route based on settings',
      (WidgetTester tester) async {
    // Arrange
    final testModule = TestModule();
    final getIt = GetIt.instance;
    await Modular.init([testModule], getIt);
    const routeSettings = RouteSettings(name: '/home');

    // Act
    final route = Modular.routes(routeSettings);

    // Assert
    expect(route is MaterialPageRoute, true);
  });

  testWidgets('Modular routes should return default route when route not found',
      (WidgetTester tester) async {
    // Arrange
    final testModule = TestModule();
    final getIt = GetIt.instance;
    await Modular.init([testModule], getIt);
    const routeSettings = RouteSettings(name: '/unknown');

    // Act
    final route = Modular.routes(routeSettings);

    // Assert
    expect(route is MaterialPageRoute, true);
  });
}
