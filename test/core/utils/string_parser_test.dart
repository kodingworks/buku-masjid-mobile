import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/core.dart';

void main() {
  group('StringParser', () {
    test('parse should return string value', () {
      expect(StringParser.parse('Hello'), equals('Hello'));
    });

    test('parse should return string value from non-null value', () {
      expect(StringParser.parse(123), equals('123'));
    });

    test('parse should return fallback value from null value', () {
      expect(StringParser.parse(null, fallbackValue: 'Fallback'),
          equals('Fallback'));
    });

    test('tryParse should return null from null value', () {
      expect(StringParser.tryParse(null), isNull);
    });

    test('tryParse should return null from invalid input', () {
      expect(StringParser.tryParse(null), isNull);
    });

    test('tryParse should return string value from valid input', () {
      expect(StringParser.tryParse('Hello'), equals('Hello'));
    });
  });
}
