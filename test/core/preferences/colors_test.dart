import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/preferences/colors.dart';

void main() {
  group('AppColors', () {
    test('cyan should have correct shade values', () {
      expect(AppColors.cyan[100], equals(const Color(0xFFB2EBF2)));
      expect(AppColors.cyan[300], equals(const Color(0xFF4DD0E1)));
      expect(AppColors.cyan[500], equals(const Color(0xFF00BCD4)));
      expect(AppColors.cyan[700], equals(const Color(0xFF0097A7)));
      expect(AppColors.cyan[900], equals(const Color(0xFF006064)));
    });
  });
}
