import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/settings/settings.dart';

class SaveThemeSettingUseCase
    implements UseCaseFuture<Failure, bool, AppTheme> {
  SaveThemeSettingUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(AppTheme params) {
    return repository.saveThemeSetting(params);
  }
}
