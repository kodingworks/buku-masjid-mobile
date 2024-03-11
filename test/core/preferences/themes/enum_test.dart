import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/core.dart';

void main() {
  group('AppThemeX', () {
    test('toThemeData should return correct theme data for light theme', () {
      final lightTheme = LightTheme(AppColors.cyan);
      final expectedTheme = lightTheme.toTheme;

      expect(
        AppTheme.light.toThemeData().primaryColor,
        equals(expectedTheme.primaryColor),
      );
    });

    test('toThemeData should return correct theme data for dark theme', () {
      final darkTheme = DarkTheme(AppColors.cyan);
      final expectedTheme = darkTheme.toTheme;

      expect(
        AppTheme.dark.toThemeData().primaryColor,
        equals(expectedTheme.primaryColor),
      );
    });
  });
}
