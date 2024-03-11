import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/utils/dismissible_keyboard.dart';

void main() {
  group('DismissibleKeyboard', () {
    testWidgets('Dismisses keyboard when tapped outside text field',
        (WidgetTester tester) async {
      // Build DismissibleKeyboard widget with a TextField inside it
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: DismissibleKeyboard(
            child: Column(
              children: <Widget>[
                TextField(),
                Text('Some other widget'),
              ],
            ),
          ),
        ),
      ));

      // Tap on the screen outside of the TextField
      await tester.tap(find.text('Some other widget'));
      await tester.pump();

      // Verify that the keyboard is dismissed
      expect(
        FocusScope.of(
          tester.element(find.text('Some other widget')),
        ).hasPrimaryFocus,
        isTrue,
      );
    });

    testWidgets('Does not dismiss keyboard when tapped inside text field',
        (WidgetTester tester) async {
      // Build DismissibleKeyboard widget with a TextField inside it
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: DismissibleKeyboard(child: TextField())),
      ));

      // Tap on the screen inside of the TextField
      await tester.tap(find.byType(TextField));
      await tester.pump();

      // Verify that the keyboard is not dismissed
      expect(
        FocusScope.of(
          tester.element(find.byType(TextField)),
        ).hasPrimaryFocus,
        isFalse,
      );
    });
  });
}
