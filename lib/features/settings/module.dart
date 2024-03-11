import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:buku_masjid/core/core.dart';

import 'settings.dart';

class SettingsModule implements BaseModule {
  @override
  Future inject(GetIt getIt) async {
    // Data
    getIt
      ..registerLazySingleton<SettingsLocalSource>(
        () => SettingsLocalSourceImpl(getIt()),
      )
      ..registerLazySingleton<SettingsRepository>(
        () => SettingsRepositoryImpl(localSource: getIt()),
      );

    // Domain
    getIt
      ..registerLazySingleton(() => GetLanguageSettingUseCase(getIt()))
      ..registerLazySingleton(() => GetSettingsUseCase(getIt()))
      ..registerLazySingleton(() => GetThemeSettingUseCase(getIt()))
      ..registerLazySingleton(() => SaveLanguageSettingUseCase(getIt()))
      ..registerLazySingleton(() => SaveSettingsUseCase(getIt()))
      ..registerLazySingleton(() => SaveThemeSettingUseCase(getIt()))
      ..registerLazySingleton(GetSupportedLanguageUseCase.new)
      ..registerLazySingleton(RecordErrorUseCase.new)
      ..registerLazySingleton(GetOnboardingDataUseCase.new)
      ..registerLazySingleton(() => SetDoneOnboardingUseCase(getIt()))
      ..registerLazySingleton(() => GetOnboardingStatusUseCase(getIt()));

    // Presentation
    getIt
      ..registerFactory(
        () => LanguageBloc(
          getLanguageSetting: getIt(),
          saveLanguageSetting: getIt(),
          getSupportedLanguage: getIt(),
        ),
      )
      ..registerFactory(
        () => ThemeBloc(
          getThemeSetting: getIt(),
          saveThemeSetting: getIt(),
        ),
      );
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    // final args = (settings.arguments ?? {}) as Map;
    return {
      SettingsPage.routeName: MaterialPageRoute(
        builder: (_) => const SettingsPage(),
        settings: settings,
      ),
    };
  }
}
