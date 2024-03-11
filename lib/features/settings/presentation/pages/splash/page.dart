import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/auth/auth.dart';
import 'package:buku_masjid/features/home/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == Auth.authorized) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainPage.routeName,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: FlutterLogo(
            size: Dimens.width(context) * .3,
          ),
        ),
      ),
    );
  }
}
