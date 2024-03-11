import 'package:flutter/material.dart';
import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/auth/module.dart';
import 'package:buku_masjid/features/home/module.dart';
import 'package:buku_masjid/features/settings/module.dart';

/// Global key for accessing the application's navigator state.
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

/// Route observer to observe route changes.
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

/// List of modules to be initialized in the application.
var appModules = <BaseModule>[
  HomeModule(),
  AuthModule(),
  SettingsModule(),
];
