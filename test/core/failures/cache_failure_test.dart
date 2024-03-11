import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/failures/base.dart';
import 'package:buku_masjid/core/failures/cache_failure.dart';

void main() {
  group('CacheFailure', () {
    test('should be a subclass of Failure', () {
      const cacheFailure = CacheFailure(message: 'Test message');
      expect(cacheFailure, isA<Failure>());
    });

    test('should return correct message', () {
      const message = 'Test message';
      const cacheFailure = CacheFailure(message: message);
      expect(cacheFailure.message, message);
    });

    test('should return null code when not provided', () {
      const cacheFailure = CacheFailure(message: 'Test message');
      expect(cacheFailure.code, isNull);
    });

    test('should return provided code', () {
      const code = 404;
      const cacheFailure = CacheFailure(message: 'Test message', code: code);
      expect(cacheFailure.code, code);
    });
  });
}
