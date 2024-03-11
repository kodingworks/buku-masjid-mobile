import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/core.dart';

void main() {
  group('ServerFailure', () {
    test('should be a subclass of Failure', () {
      const serverFailure = ServerFailure(message: 'Test message');
      expect(serverFailure, isA<Failure>());
    });

    test('should return correct message', () {
      const message = 'Test message';
      const serverFailure = ServerFailure(message: message);
      expect(serverFailure.message, message);
    });

    test('should return null code when not provided', () {
      const serverFailure = ServerFailure(message: 'Test message');
      expect(serverFailure.code, isNull);
    });

    test('should return provided code', () {
      const code = 404;
      const serverFailure = ServerFailure(message: 'Test message', code: code);
      expect(serverFailure.code, code);
    });
  });
}
