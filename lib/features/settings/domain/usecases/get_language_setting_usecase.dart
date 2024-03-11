import 'dart:async';

import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/settings/settings.dart';
import 'package:dartz/dartz.dart';

class GetLanguageSettingUseCase
    implements UseCaseFuture<Failure, Language, NoParams> {
  GetLanguageSettingUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, Language>> call(NoParams params) {
    return repository.getLanguageSetting();
  }
}
