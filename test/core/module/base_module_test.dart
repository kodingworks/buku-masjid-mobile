import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:buku_masjid/core/module/base_module.dart';

class TestModule extends BaseModule {
  @override
  Map<String, Route> routes(RouteSettings settings) {
    return {
      '/home': MaterialPageRoute(
          builder: (_) => const Scaffold(body: Text('Home Page'))),
      '/auth': MaterialPageRoute(
          builder: (_) => const Scaffold(body: Text('Auth Page'))),
    };
  }

  @override
  Future<void> inject(GetIt getIt) async {
    // Register dependencies
    getIt.registerSingleton<String>('TestDependency');
  }
}

void main() {
  final getIt = GetIt.instance;

  testWidgets('Test Module should inject dependencies',
      (WidgetTester tester) async {
    // Arrange
    final testModule = TestModule();

    // Act
    await testModule.inject(getIt);

    // Assert
    expect(getIt.isRegistered<String>(), true);
  });
}
