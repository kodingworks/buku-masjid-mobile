import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/preferences/icons.dart';

void main() {
  testWidgets('Test custom icons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Custom Icons Test'),
          ),
          body: const Icon(AppIcons.clock),
        ),
      ),
    );

    // Cek apakah semua ikon tersedia
    expect(find.byIcon(AppIcons.clock), findsOneWidget);
  });
}
