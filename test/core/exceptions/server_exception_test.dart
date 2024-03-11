import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/exceptions/server_exception.dart';

void main() {
  group('ServerException', () {
    test('GeneralServerException toString returns correct representation', () {
      const exception =
          GeneralServerException(message: 'General server error', code: 500);

      expect(exception.toString(),
          'GeneralServerException(message: General server error, code: 500)');
    });

    // Tambahkan unit test untuk kelas exception lainnya di sini
  });
}
