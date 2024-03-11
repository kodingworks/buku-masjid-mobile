import 'package:dio/dio.dart';
import 'package:buku_masjid/core/core.dart';

/// Extension for converting DioException to specific ServerException types.
extension DioErrorExtension on DioException {
  /// Converts DioException to ServerException.
  ServerException toServerException() {
    final meta = response?.data['meta'] != null
        ? MetaError.fromJson(response?.data['meta'])
        : null;
    switch (type) {
      case DioExceptionType.badResponse:
        switch (response?.statusCode) {
          case 401:
            return UnAuthenticationServerException(
              message: meta?.message ?? 'Unauthorized',
              code: response?.statusCode,
            );
          case 403:
            return UnAuthorizeServerException(
              message: meta?.message ?? 'Forbidden',
              code: response?.statusCode,
            );
          case 404:
            return NotFoundServerException(
              message: meta?.message ?? 'Not found',
              code: response?.statusCode,
            );
          case 500:
          case 502:
            return InternalServerException(
              message: meta?.message ?? 'Internal server error',
              code: response?.statusCode,
            );
          default:
            return GeneralServerException(
              message: meta?.message ?? 'Internal server error',
              code: response?.statusCode,
            );
        }

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeOutServerException(
          message: meta?.message ?? 'Connection timeout',
          code: response?.statusCode,
        );

      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return GeneralServerException(
          message: meta?.message ?? 'A Server Error Occurred',
          code: response?.statusCode,
        );
    }
  }
}
