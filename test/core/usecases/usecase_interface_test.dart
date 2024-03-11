import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:buku_masjid/core/usecases/usecase_interface.dart';

void main() {
  group('UseCaseFuture', () {
    test('call should return Right with valid data', () async {
      final useCase = TestUseCaseFuture();
      final result = await useCase.call(TestParams());

      expect(result, isA<Right<Failure, String>>());
      expect(result.getOrElse(() => 'error'), equals('Data'));
    });
  });

  group('UseCaseStream', () {
    test('call should return Stream of Right with valid data', () {
      final useCase = TestUseCaseStream();
      final result = useCase.call(TestParams());

      expect(result, emits(isA<Right<Failure, String>>()));
    });

    test('call should return Stream of Left with failure data', () {
      final useCase = TestUseCaseStream();
      final result = useCase.call(FailureParams());

      expect(result, emits(isA<Left<Failure, String>>()));
    });
  });
}

class TestUseCaseFuture implements UseCaseFuture<Failure, String, Params> {
  @override
  Future<Either<Failure, String>> call(Params params) async {
    if (params is TestParams) {
      return const Right('Data');
    } else {
      return Left(Failure());
    }
  }
}

class TestUseCaseStream implements UseCaseStream<Failure, String, Params> {
  @override
  Stream<Either<Failure, String>> call(Params params) async* {
    if (params is TestParams) {
      yield const Right('Data');
    } else {
      yield Left(Failure());
    }
  }
}

class Params {}

class TestParams extends Params {}

class FailureParams extends Params {}

class Failure {}
