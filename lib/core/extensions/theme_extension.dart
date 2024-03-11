import 'package:flutter/material.dart';
import 'package:buku_masjid/core/core.dart';

/// Extension for accessing theme-related properties in a BuildContext.
extension ThemeExtension on BuildContext {
  /// Retrieves the current [ThemeData] from the context's theme.
  ThemeData get theme => Theme.of(this);

  /// Retrieves the current AdaptiveTheme instance with the current style.
  AdaptiveTheme get adaptiveTheme => AdaptiveTheme(themeData: theme);
}
