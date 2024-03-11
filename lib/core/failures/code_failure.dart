import 'package:buku_masjid/core/core.dart';

/// Represents a failure related to code.
class CodeFailure extends Failure {
  /// Constructs a [CodeFailure] with the provided [message] and optional [code].
  const CodeFailure({
    required super.message,
    super.code,
  });
}
