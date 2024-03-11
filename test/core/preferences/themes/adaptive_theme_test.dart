import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/preferences/themes/adaptive_theme.dart';

void main() {
  group('AdaptiveTheme', () {
    test('constructor should create instance with provided theme data', () {
      final themeData = ThemeData(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white);
      final adaptiveTheme = AdaptiveTheme(themeData: themeData);

      expect(adaptiveTheme.themeData, equals(themeData));
    });

    test('text styles should return correct values', () {
      final themeData = ThemeData(
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 20),
          titleLarge: TextStyle(fontSize: 18),
          titleMedium: TextStyle(fontSize: 16),
          bodyLarge: TextStyle(fontSize: 14),
          bodyMedium: TextStyle(fontSize: 12),
          bodySmall: TextStyle(fontSize: 10),
          labelLarge: TextStyle(fontSize: 16),
        ),
      );
      final adaptiveTheme = AdaptiveTheme(themeData: themeData);

      expect(adaptiveTheme.headingTextStyle?.fontSize, equals(20));
      expect(adaptiveTheme.titleTextStyle?.fontSize, equals(18));
      expect(adaptiveTheme.subTitleTextStyle?.fontSize, equals(16));
      expect(adaptiveTheme.labelTextStyle?.fontSize, equals(14));
      expect(adaptiveTheme.regularTextStyle?.fontSize, equals(12));
      expect(adaptiveTheme.captionTextStyle?.fontSize, equals(10));
      expect(adaptiveTheme.buttonTextStyle?.fontSize, equals(16));
    });
  });
}
