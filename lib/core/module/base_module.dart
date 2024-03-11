import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// Base class for module implementation.
///
/// Every module should implement:
///
/// - Dependency Injection
/// - Routing
///
abstract class BaseModule {
  /// Define routes for your module.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// {
  ///   '/home': MaterialPageRoute(builder: (_) => HomePage()),
  ///   '/auth': CupertinoPageRoute(builder: (_) => AuthPage()),
  /// ]
  /// ```
  Map<String, Route> routes(RouteSettings settings);

  /// Inject all dependencies.
  ///
  /// This method should register all necessary dependencies using the provided [getIt].
  Future<void> inject(GetIt getIt);
}
