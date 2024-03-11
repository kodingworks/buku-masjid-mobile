import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  /// Provides access to the AppLocalizations instance for localization purposes.
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// Provides access to the CupertinoLocalizations instance for Cupertino widgets localization.
  CupertinoLocalizations get l10nCupertino => CupertinoLocalizations.of(this);

  /// Provides access to the MaterialLocalizations instance for Material widgets localization.
  MaterialLocalizations get l10nMaterial => MaterialLocalizations.of(this);
}
