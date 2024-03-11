import 'package:buku_masjid/core/core.dart';

/// Represents a failure related to server communication.
class ServerFailure extends Failure {
  /// Constructs a [ServerFailure] with the provided [message] and optional [code].
  const ServerFailure({
    required super.message,
    super.code,
  });
}
