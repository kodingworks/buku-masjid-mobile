import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/core.dart';

void main() {
  group('NumParser', () {
    test('intParse should return int value', () {
      expect(NumParser.intParse(12), equals(12));
    });

    test('intParse should return int value from double', () {
      expect(NumParser.intParse(12.5), equals(12));
    });

    test('intParse should return int value from valid string', () {
      expect(NumParser.intParse('12'), equals(12));
    });

    test('intParse should return fallback value from invalid string', () {
      expect(NumParser.intParse('invalid', fallbackValue: 100), equals(100));
    });

    test('intParse should return 0 from null value', () {
      expect(NumParser.intParse(null), 0);
    });

    test('tryIntParse should return null from invalid input', () {
      expect(NumParser.tryIntParse('invalid'), isNull);
    });

    test('doubleParse should return double value', () {
      expect(NumParser.doubleParse(12.5), equals(12.5));
    });

    test('doubleParse should return double value from int', () {
      expect(NumParser.doubleParse(12), equals(12.0));
    });

    test('doubleParse should return double value from valid string', () {
      expect(NumParser.doubleParse('12.5'), equals(12.5));
    });

    test('doubleParse should return fallback value from invalid string', () {
      expect(NumParser.doubleParse('invalid', fallbackValue: 100.0),
          equals(100.0));
    });

    test('doubleParse should return 0 from null value', () {
      expect(NumParser.doubleParse(null), 0);
    });

    test('tryDoubleParse should return null from invalid input', () {
      expect(NumParser.tryDoubleParse('invalid'), isNull);
    });
  });
}
