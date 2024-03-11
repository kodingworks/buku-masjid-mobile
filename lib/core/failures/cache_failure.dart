import 'package:buku_masjid/core/core.dart';

/// Represents a failure related to caching.
class CacheFailure extends Failure {
  /// Constructs a [CacheFailure] with the provided [message] and optional [code].
  const CacheFailure({
    required super.message,
    super.code,
  });
}
