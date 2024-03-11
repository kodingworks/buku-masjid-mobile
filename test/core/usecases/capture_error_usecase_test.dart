import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buku_masjid/core/failures/failures.dart';
import 'package:buku_masjid/core/usecases/capture_error_usecase.dart';

void main() {
  group('CaptureErrorUseCase', () {
    test('call should capture error and return Right(true)', () async {
      final useCase = CaptureErrorUseCase();

      final result = await useCase.call(
          CaptureErrorParams(Exception('Test Exception'), StackTrace.empty));

      expect(result, isA<Right<Failure, bool>>());
      expect(result.getOrElse(() => false), equals(true));
    });
  });
}
