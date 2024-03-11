import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/preferences/colors.dart';
import 'package:buku_masjid/core/preferences/themes/light_theme.dart';

void main() {
  test('LightTheme should have correct values', () {
    const primaryColor = Colors.blue;
    final lightTheme = LightTheme(primaryColor);

    // Test properties
    expect(lightTheme.primaryColor, primaryColor);

    // Test ColorScheme
    expect(lightTheme.scheme.primary, primaryColor);
    expect(lightTheme.scheme.surface, primaryColor);
    expect(lightTheme.scheme.secondary, AppColors.orange);
  });
}
