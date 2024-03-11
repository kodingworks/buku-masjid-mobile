/// Represents meta error information.
class MetaError {
  /// Error code.
  final int code;

  /// Error status.
  final String status;

  /// Error message.
  final String message;

  /// Constructs a [MetaError].
  MetaError({
    required this.code,
    required this.status,
    required this.message,
  });

  /// Creates a [MetaError] instance from JSON data.
  factory MetaError.fromJson(Map<String, dynamic> json) => MetaError(
        code: json['code'],
        status: json['status'],
        message: json['message'],
      );
}
