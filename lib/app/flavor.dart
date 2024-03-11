/// Enumeration defining different flavors of the application.
enum Flavor {
  /// Development flavor.
  development,

  /// Staging flavor.
  staging,

  /// Production flavor.
  production
}

/// A class to manage the current flavor of the application.
class F {
  /// The current flavor of the application.
  static late Flavor flavor;
}
