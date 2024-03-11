import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/app/flavor.dart';

void main() {
  group('app/', () {
    test('Check when run with Flavor.dev valid or not', () {
      // arrange
      const expected = Flavor.development;

      // actual
      F.flavor = Flavor.development;

      // assert
      expect(F.flavor, expected);
    });

    test('Check when run with Flavor.staging valid or not', () {
      // arrange
      const expected = Flavor.staging;

      // actual
      F.flavor = Flavor.staging;

      // assert
      expect(F.flavor, expected);
    });

    test('Check when run with Flavor.prod valid or not', () {
      // arrange
      const expected = Flavor.production;

      // actual
      F.flavor = Flavor.production;

      // assert
      expect(F.flavor, expected);
    });
  });
}
