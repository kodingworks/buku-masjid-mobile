import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/app/config.dart';
import 'package:buku_masjid/app/flavor.dart';

void main() {
  group('app/', () {
    group('Check value FlavorConfig from current Flavor', () {
      test('Dev', () {
        // arrange
        F.flavor = Flavor.development;
        const expectResult = 'development';

        // actual
        const result = FlavorConfig(
            development: 'development',
            production: 'production',
            staging: 'staging');

        // assert
        expect(result.value, expectResult);
      });

      test('Prod', () {
        // arrange
        F.flavor = Flavor.production;
        const expectResult = 'production';

        // actual
        const result = FlavorConfig(
            development: 'development',
            production: 'production',
            staging: 'staging');

        // assert
        expect(result.value, expectResult);
      });

      test('Staging', () {
        // arrange
        F.flavor = Flavor.staging;
        const expectResult = 'staging';

        // actual
        const result = FlavorConfig(
            development: 'development',
            production: 'production',
            staging: 'staging');

        // assert
        expect(result.value, expectResult);
      });
    });

    test(
        'Check Assertion when fallback is null, '
        'and in some flavor config is null', () {
      // arrange
      F.flavor = Flavor.development;

      // assert
      expect(
        () {
          FlavorConfig(
              development: 'development', production: null, staging: 'staging');
        },
        throwsAssertionError,
      );
    });

    test(
        'Check Assertion when fallback is null, '
        'and all flavor config is null', () {
      // arrange
      F.flavor = Flavor.staging;

      // assert
      expect(
        () {
          FlavorConfig(development: null, production: null, staging: null);
        },
        throwsAssertionError,
      );
    });

    test('Check use fallback value when value in current flavor is null', () {
      // arrange
      F.flavor = Flavor.production;

      // actual
      const result = FlavorConfig(
        development: null,
        production: null,
        staging: null,
        fallback: 'fallback',
      );

      // assert
      expect(result.value, 'fallback');
    });
  });
}
