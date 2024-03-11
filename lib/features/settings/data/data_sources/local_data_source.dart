import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:buku_masjid/app/config.dart';
import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/settings/settings.dart';

abstract class SettingsLocalSource implements CacheDataSource<Settings> {
  Future<bool> setTheme(AppTheme theme);

  Future<bool> setLanguage(Language language);

  Future<bool> setDoneOnboarding();

  Future<bool> getOnboardingStatus();
}

class SettingsLocalSourceImpl implements SettingsLocalSource {
  SettingsLocalSourceImpl(this.hive);

  final HiveInterface hive;

  @override
  String cacheKey = 'SETTING_DATA_SOURCE_KEY';

  @override
  Future<bool> clearCache() async {
    try {
      final box = await _getBox();
      await box?.clear();

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<Settings> getData() async {
    try {
      final box = await _getBox();
      final boxData = box?.get('data');
      if (boxData != null && boxData is String) {
        return Settings.fromJson(
          json.decode(boxData) as Map<String, dynamic>,
        );
      }

      throw const NotFoundCacheException(message: 'Cache Not Found');
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isCached() async {
    try {
      final box = await _getBox();

      return box?.get('data') != null;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> saveCache(Settings data) async {
    try {
      final box = await _getBox();

      await box?.put('data', json.encode(data.toJson()));

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<Box<Object?>?> _getBox() async {
    if (!hive.isBoxOpen(cacheKey)) {
      return hive.openBox(cacheKey);
    }

    return hive.box(cacheKey);
  }

  @override
  Future<bool> setLanguage(Language language) async {
    try {
      if (await isCached()) {
        final currentData = await getData();

        await saveCache(currentData.copyWith(language: language));
        return true;
      }

      await saveCache(
        Settings(
          theme: AppConfig.defaultTheme,
          language: language,
        ),
      );

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> setTheme(AppTheme theme) async {
    try {
      if (await isCached()) {
        final currentData = await getData();

        await saveCache(currentData.copyWith(theme: theme));
        return true;
      }

      await saveCache(
        Settings(
          theme: theme,
          language: null,
        ),
      );

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> getOnboardingStatus() async {
    try {
      final box = await _getBox();
      final status = box?.get('onboarding_status');

      return status == true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> setDoneOnboarding() async {
    try {
      final box = await _getBox();
      await box?.put('onboarding_status', true);

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
