import 'package:buku_masjid/core/exceptions/cache_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CacheException', () {
    test('toString returns correct representation', () {
      const exception = CacheException(message: 'Cache error', code: 404);

      expect(exception.toString(),
          'CacheException(message: Cache error, code: 404)');
    });
  });

  group('NotFoundCacheException', () {
    test('toString returns correct representation', () {
      const exception = NotFoundCacheException(message: 'Cache not found');

      expect(exception.toString(),
          'NotFoundCacheException(message: Cache not found, code: null)');
    });

    test('inherits from CacheException', () {
      const exception = NotFoundCacheException(message: 'Cache not found');

      expect(exception, isA<CacheException>());
    });
  });

  group('ExpiredCacheException', () {
    test('toString returns correct representation', () {
      const exception =
          ExpiredCacheException(message: 'Cache expired', code: 500);

      expect(exception.toString(),
          'ExpiredCacheException(message: Cache expired, code: 500)');
    });

    test('inherits from CacheException', () {
      const exception = ExpiredCacheException(message: 'Cache expired');

      expect(exception, isA<CacheException>());
    });
  });
}
