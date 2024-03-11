import 'package:buku_masjid/core/exceptions/code_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ErrorCodeException', () {
    test('toString returns correct representation', () {
      const exception =
          ErrorCodeException(message: 'Error with code', code: 404);

      expect(exception.toString(),
          'ErrorCodeException(message: Error with code, code: 404)');
    });
  });
}
