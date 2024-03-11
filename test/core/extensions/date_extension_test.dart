import 'package:buku_masjid/core/extensions/date_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  group('IndonesianDateFormatter', () {
    initializeDateFormatting('id_ID', null);

    test('toTransaction returns correct format', () {
      // Create a DateTime object to be formatted
      final dateTime = DateTime(2024, 3, 8, 10, 30);

      // Format the DateTime object
      final formattedDate = dateTime.toTransaction;

      // Define the expected result
      const expected = '08-Maret-2024 10:30';

      // Assert that the formatted date matches the expected result
      expect(formattedDate, equals(expected));
    });

    // Add more test cases if needed
  });
}
