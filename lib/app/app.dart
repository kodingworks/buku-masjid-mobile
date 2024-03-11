import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/auth/auth.dart';
import 'package:buku_masjid/features/home/presentation/blocs/blocs.dart';
import 'package:buku_masjid/features/settings/settings.dart';
import 'package:buku_masjid/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'config.dart';
import 'modules.dart';

/// This class represents the main entry point of the application.
class App extends StatelessWidget {
  const App({super.key});

  /// Builds the root widget of the application.
  @override
  Widget build(BuildContext context) {
    // Set system UI overlay styles
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            AppConfig.transparentStatusBar ? Colors.transparent : null,
        statusBarIconBrightness: AppConfig.defaultTheme == AppTheme.dark
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
    );

    // Set preferred device orientations
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return MultiBlocProvider(
      providers: [
        // Provides the ThemeBloc to manage theme changes
        BlocProvider(
          create: (context) => GetIt.I<ThemeBloc>()
            ..add(
              const ThemeChanged(AppConfig.defaultTheme),
            ),
        ),
        // Provides the LanguageBloc to manage language changes
        BlocProvider(
          create: (context) =>
              GetIt.I<LanguageBloc>()..add(const LanguageStarted()),
        ),
        // Provides the AuthBloc to manage authentication state
        BlocProvider(
          create: (context) => GetIt.I<AuthBloc>()..add(AuthenticateEvent()),
        ),
        // Provides the BottomNavBloc for bottom navigation management
        BlocProvider(create: (context) => BottomNavBloc()),
      ],
      child: _AppWidget(key: key),
    );
  }
}

class _AppWidget extends StatelessWidget {
  const _AppWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    // Retrieve language and theme states from their respective blocs
    final languageState = context.watch<LanguageBloc>().state;
    final themeState = context.watch<ThemeBloc>().state;

    return MaterialApp(
      // Set the navigator key
      navigatorKey: navigationKey,
      // Set the application title
      title: AppConfig.appName,
      // Set the application theme based on the current theme state
      theme: themeState.theme.toThemeData(),
      // Set the application locale based on the current language state
      locale: languageState.language != null
          ? Locale(languageState.language!.code)
          : null,
      // Disable debug banner
      debugShowCheckedModeBanner: false,
      // Register navigator observers
      navigatorObservers: [routeObserver],
      // Register localizations delegates
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Define supported locales
      supportedLocales: AppLocalizations.supportedLocales,
      // Define route generation method
      onGenerateRoute: Modular.routes,
      // Set the initial page to SplashPage
      home: const SplashPage(),
    );
  }
}
