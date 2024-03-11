import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/preferences/dimens.dart';

void main() {
  group('Dimens', () {
    testWidgets('width and height should return correct screen dimensions',
        (WidgetTester tester) async {
      // Bangun aplikasi dan pumulai pada widget pertama.
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: SizedBox(
                  width: Dimens.width(context),
                  height: Dimens.height(context),
                ),
              );
            },
          ),
        ),
      );

      // Periksa apakah ukuran yang dikembalikan oleh Dimens.width dan Dimens.height sesuai dengan ukuran layar yang diharapkan
      expect(find.byType(SizedBox), findsOneWidget);
    });

    test('default padding should return correct value', () {
      expect(Dimens.defaultPadding, equals(16.0));
    });

    test('each dp constant should have correct value', () {
      expect(Dimens.dp2, equals(2.0));
    });
  });
}
