import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/settings/settings.dart';

class GetOnboardingStatusUseCase
    implements UseCaseFuture<Failure, bool, NoParams> {
  const GetOnboardingStatusUseCase(this.repository);

  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(NoParams params) {
    return repository.getOnboardingStatus();
  }
}
