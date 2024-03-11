import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:buku_masjid/core/core.dart';

import 'app/app.dart';
import 'app/flavor.dart';
import 'app/locator.dart';

/// The main entry point for the application in staging mode.
Future<void> main() async {
  // Set the application flavor to staging
  F.flavor = Flavor.staging;

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Set up the service locator
      await setupLocator();

      // Set the Bloc observer
      Bloc.observer = AppBlocObserver();

      // Run the application
      return runApp(const App());
    },
    // Error handling
    (error, stackTrace) {
      // Capture and log errors
      GetIt.I<CaptureErrorUseCase>().call(
        CaptureErrorParams(error, stackTrace),
      );
      log(
        error.toString(),
        name: 'LOG',
        stackTrace: stackTrace,
      );
    },
  );
}
