import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/extensions/theme_extension.dart';
import 'package:buku_masjid/core/preferences/themes/adaptive_theme.dart';

void main() {
  testWidgets('ThemeExtension test', (WidgetTester tester) async {
    // Build a MaterialApp with a MaterialApp widget
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            // Test theme retrieval
            expect(context.theme, isNotNull);
            expect(context.theme, isA<ThemeData>());

            // Test adaptiveTheme retrieval
            expect(context.adaptiveTheme, isNotNull);
            expect(context.adaptiveTheme, isA<AdaptiveTheme>());

            return Container();
          },
        ),
      ),
    );
  });
}
