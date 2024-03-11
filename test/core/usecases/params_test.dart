import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/usecases/params.dart';

void main() {
  group('PaginateParams', () {
    test('should return true for same page and limit', () {
      const params1 = PaginateParams(page: 1, limit: 10);
      const params2 = PaginateParams(page: 1, limit: 10);

      expect(params1, equals(params2));
    });

    test('should return false for different page or limit', () {
      const params1 = PaginateParams(page: 1, limit: 10);
      const params2 = PaginateParams(page: 2, limit: 10);

      expect(params1 == params2, isFalse);
    });
  });

  group('SearchParams', () {
    test('should return true for same query and page', () {
      const params1 = SearchParams(query: 'search', page: 1);
      const params2 = SearchParams(query: 'search', page: 1);

      expect(params1, equals(params2));
    });

    test('should return false for different query or page', () {
      const params1 = SearchParams(query: 'search', page: 1);
      const params2 = SearchParams(query: 'search', page: 2);

      expect(params1 == params2, isFalse);
    });
  });
}
