import 'package:equatable/equatable.dart';

/// Base class for representing failures.
///
/// Extend this class to create custom failure types.
abstract class Failure extends Equatable {
  /// The message describing the failure.
  final String message;

  /// Additional error code.
  final Object? code;

  /// Additional error code.
  final String? errorCode;

  /// Constructs a [Failure] with the provided [message], [code], and [errorCode].
  const Failure({
    required this.message,
    this.code,
    this.errorCode,
  });

  @override
  List<Object?> get props => [message, code, errorCode];
}
