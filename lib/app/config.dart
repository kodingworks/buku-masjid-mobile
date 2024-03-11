import 'package:buku_masjid/core/core.dart';

import 'flavor.dart';

/// This class holds configuration values for the application.
class AppConfig {
  /// The name of the application.
  static const String appName = 'starter';

  /// The default font family used throughout the application.
  static const String fontFamily = 'PlusJakartaSans';

  /// The base URL used for API requests, configured based on the current flavor.
  static const FlavorConfig<String> baseUrl = FlavorConfig<String>(
    production: 'https://starter.donisaputra.com/api',
    development: 'https://starter.donisaputra.com/api',
    staging: 'https://starter.donisaputra.com/api',
  );

  /// The default theme of the application.
  static const AppTheme defaultTheme = AppTheme.light;

  /// Whether to automatically stringify Equatable objects for debugging.
  static const bool autoStringifyEquatable = true;

  /// Whether to use a transparent status bar.
  static const bool transparentStatusBar = true;
}

/// A class to define different configurations based on the application flavor.
class FlavorConfig<T> {
  /// Constructor to initialize configuration values for different flavors.
  const FlavorConfig({
    required this.development,
    required this.production,
    required this.staging,
    this.fallback,
  }) : assert(
          development == null || production == null || staging == null
              ? fallback != null
              : true,
          '[fallback]cannot be null if there is one flavor whose value is null',
        );

  /// Configuration value for development flavor.
  final T? development;

  /// Configuration value for production flavor.
  final T? production;

  /// Configuration value for staging flavor.
  final T? staging;

  /// Fallback value if the current flavor's value is null.
  final T? fallback;

  /// Get the value of the current flavor.
  T get value {
    switch (F.flavor) {
      case Flavor.development:
        return development ?? fallback!;
      case Flavor.staging:
        return staging ?? fallback!;
      case Flavor.production:
        return production ?? fallback!;
    }
  }
}
