import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:buku_masjid/core/core.dart';

void main() {
  group('DioErrorExtension', () {
    test('toServerException returns correct exception for badResponse', () {
      final response = Response(
        statusCode: 401,
        data: {
          'meta': {'message': 'Unauthorized', 'code': 401, 'status': 'error'}
        },
        requestOptions: RequestOptions(),
      );
      final dioException = DioException(
        response: response,
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
      );

      final serverException = dioException.toServerException();

      expect(serverException, isA<UnAuthenticationServerException>());
      expect(serverException.message, 'Unauthorized');
      expect(serverException.code, 401);
    });

    test('toServerException returns correct exception for connectionTimeout',
        () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.sendTimeout,
      );

      final serverException = dioException.toServerException();

      expect(serverException, isA<TimeOutServerException>());
      expect(serverException.message, 'Connection timeout');
    });

    // Add more test cases for other types of DioException if needed
  });
}
