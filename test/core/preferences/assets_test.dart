import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/core.dart';

void main() {
  group('MainAssets', () {
    test('pathLanguage should return correct path for language flag image', () {
      expect(
          MainAssets.pathLanguage('en'), equals('assets/images/flags/en.png'));
      expect(
          MainAssets.pathLanguage('fr'), equals('assets/images/flags/fr.png'));
    });

    test('other asset paths should be correct', () {
      expect(MainAssets.blankImg, equals('assets/images/bitmap/blank.png'));
      expect(MainAssets.priceSvg,
          equals('assets/images/illustration/ill_price.svg'));
      expect(MainAssets.upIcon, equals('assets/images/icons/up.png'));
    });
  });
}
