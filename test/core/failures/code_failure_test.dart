import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/failures/base.dart';
import 'package:buku_masjid/core/failures/code_failure.dart';

void main() {
  group('CodeFailure', () {
    test('should be a subclass of Failure', () {
      const codeFailure = CodeFailure(message: 'Test message');
      expect(codeFailure, isA<Failure>());
    });

    test('should return correct message', () {
      const message = 'Test message';
      const codeFailure = CodeFailure(message: message);
      expect(codeFailure.message, message);
    });

    test('should return null code when not provided', () {
      const codeFailure = CodeFailure(message: 'Test message');
      expect(codeFailure.code, isNull);
    });

    test('should return provided code', () {
      const code = 404;
      const codeFailure = CodeFailure(message: 'Test message', code: code);
      expect(codeFailure.code, code);
    });
  });
}
