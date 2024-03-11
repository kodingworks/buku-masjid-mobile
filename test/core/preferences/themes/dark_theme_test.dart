import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/preferences/colors.dart';
import 'package:buku_masjid/core/preferences/themes/dark_theme.dart';

void main() {
  test('DarkTheme should have correct values', () {
    const primaryColor = Colors.blue;
    final darkTheme = DarkTheme(primaryColor);

    // Test properties
    expect(darkTheme.primaryColor, primaryColor);

    // Test ColorScheme
    expect(darkTheme.scheme.primary, primaryColor);
    expect(darkTheme.scheme.surface, AppColors.black);
    expect(darkTheme.scheme.secondary, AppColors.blue);
  });
}
