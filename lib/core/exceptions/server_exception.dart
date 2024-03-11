/// Abstract class representing a server exception.
abstract class ServerException implements Exception {
  const ServerException({required this.message, this.code});

  final String message;
  final Object? code;
}

/// Exception thrown when a general server error occurs.
class GeneralServerException extends ServerException {
  const GeneralServerException({
    required super.message,
    super.code,
  });

  @override
  String toString() => 'GeneralServerException(message: $message, code: $code)';
}

/// Exception thrown when a server timeout occurs.
class TimeOutServerException extends ServerException {
  const TimeOutServerException({
    required super.message,
    super.code,
  });

  @override
  String toString() => 'TimeOutServerException(message: $message, code: $code)';
}

/// Exception thrown when a requested resource is not found on the server.
class NotFoundServerException extends ServerException {
  const NotFoundServerException({
    required super.message,
    super.code,
  });

  @override
  String toString() =>
      'NotFoundServerException(message: $message, code: $code)';
}

/// Exception thrown when the server requires authentication for access.
class UnAuthenticationServerException extends ServerException {
  const UnAuthenticationServerException({
    required super.message,
    super.code,
  });

  @override
  String toString() =>
      'UnAuthenticationServerException(message: $message, code: $code)';
}

/// Exception thrown when the server denies access due to insufficient permissions.
class UnAuthorizeServerException extends ServerException {
  const UnAuthorizeServerException({
    required super.message,
    super.code,
  });

  @override
  String toString() =>
      'UnAuthorizeServerException(message: $message, code: $code)';
}

/// Exception thrown when an internal server error occurs.
class InternalServerException extends ServerException {
  const InternalServerException({
    required super.message,
    super.code,
  });

  @override
  String toString() =>
      'InternalServerException(message: $message, code: $code)';
}
