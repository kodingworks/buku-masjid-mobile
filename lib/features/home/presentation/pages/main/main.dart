import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buku_masjid/features/home/home.dart';
import 'package:buku_masjid/features/settings/settings.dart';
import 'package:buku_masjid/l10n/l10n.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = const [HomePage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, index) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: pages[index],
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (v) {
              context.read<BottomNavBloc>().add(BottomNavChanged(v));
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_rounded),
                label: l10n.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings_rounded),
                label: l10n.settings,
              ),
            ],
          ),
        );
      },
    );
  }
}
