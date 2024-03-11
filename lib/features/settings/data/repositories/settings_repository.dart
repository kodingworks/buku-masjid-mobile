import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/settings/settings.dart';
import 'package:dartz/dartz.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required this.localSource});

  final SettingsLocalSource localSource;

  @override
  Future<Either<Failure, Language>> getLanguageSetting() async {
    try {
      final result = await localSource.getData();

      if (result.language != null) {
        return Right(result.language!);
      }

      throw const NotFoundCacheException(message: 'Cache Not Found');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, Settings>> getSettings() async {
    try {
      final result = await localSource.getData();

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, AppTheme>> getThemeSetting() async {
    try {
      final result = await localSource.getData();

      if (result.theme != null) {
        return Right(result.theme!);
      }

      throw const NotFoundCacheException(message: 'Cache Not Found');
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveSettings(Settings setting) async {
    try {
      final result = await localSource.saveCache(setting);

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveLanguageSetting(Language language) async {
    try {
      final result = await localSource.setLanguage(language);

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> saveThemeSetting(AppTheme theme) async {
    try {
      final result = await localSource.setTheme(theme);

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> getOnboardingStatus() async {
    try {
      final result = await localSource.getOnboardingStatus();

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, bool>> setDoneOnboarding() async {
    try {
      final result = await localSource.setDoneOnboarding();

      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, code: e.code));
    }
  }
}
