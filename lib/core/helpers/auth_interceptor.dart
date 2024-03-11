import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:buku_masjid/features/auth/auth.dart';

/// Error handling for authentication-related errors in interceptors.
class AuthHttpInterceptor extends InterceptorsWrapper {
  AuthHttpInterceptor(this.authLocalSource);

  /// Data source to retrieve the current token.
  final AuthLocalDataSource authLocalSource;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await authLocalSource.getData();

    final optionHeaders = <String, Object>{};

    if (token != null) {
      log(token, name: 'TOKEN');
      optionHeaders.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    options.headers.addAll(optionHeaders);
    handler.next(options);
  }
}
