/// Exception thrown when an issue related to cache occurs.
class CacheException implements Exception {
  const CacheException({required this.message, this.code});

  final String message;
  final Object? code;

  @override
  String toString() => 'CacheException(message: $message, code: $code)';
}

/// Exception thrown when cache is empty or not found.
class NotFoundCacheException extends CacheException {
  const NotFoundCacheException({
    required super.message,
    super.code,
  });

  @override
  String toString() => 'NotFoundCacheException(message: $message, code: $code)';
}

/// Exception thrown when cache is expired.
class ExpiredCacheException extends CacheException {
  const ExpiredCacheException({
    required super.message,
    super.code,
  });

  @override
  String toString() => 'ExpiredCacheException(message: $message, code: $code)';
}
