import 'package:buku_masjid/core/extensions/currency_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyFormat', () {
    test('toIDR() formats numeric value correctly', () {
      expect(10000.toIDR(), equals('IDR 10.000'));
      expect(12345678.toIDR(), equals('IDR 12.345.678'));
      expect((-5000).toIDR(), equals('-IDR 5.000'));
      expect(0.toIDR(), equals('IDR 0'));
    });
  });
}
