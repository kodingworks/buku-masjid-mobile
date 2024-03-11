import 'package:buku_masjid/core/core.dart';
import 'package:dartz/dartz.dart';

/// A use case for capturing errors and reporting them.
class CaptureErrorUseCase
    implements UseCaseFuture<Failure, bool, CaptureErrorParams> {
  /// Constructor for creating a CaptureErrorUseCase.
  CaptureErrorUseCase();

  // final FirebaseCrashlytics firebaseCrashlytics;

  @override
  Future<Either<Failure, bool>> call(CaptureErrorParams params) async {
    try {
      // await Sentry.captureException(
      //   params.exception,
      //   stackTrace: params.stackTrace,
      // );

      // await firebaseCrashlytics.recordError(
      //   params.exception,
      //   params.stackTrace as StackTrace?,
      // );

      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

/// Parameters for capturing an error.
class CaptureErrorParams {
  /// Constructor for creating CaptureErrorParams.
  CaptureErrorParams(this.exception, this.stackTrace);

  /// The exception object.
  final Object exception;

  /// The stack trace.
  final dynamic stackTrace;
}
