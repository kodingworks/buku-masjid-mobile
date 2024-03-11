import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/settings/settings.dart';

class SaveSettingsUseCase implements UseCaseFuture<Failure, bool, Settings> {
  SaveSettingsUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(Settings params) {
    return repository.saveSettings(params);
  }
}
