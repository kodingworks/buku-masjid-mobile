import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/settings/settings.dart';
import 'package:buku_masjid/l10n/l10n.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ListTile(
          leading: Icon(
            Icons.format_color_fill_rounded,
            color: context.theme.disabledColor,
          ),
          title: SubTitleText(l10n.themes),
          subtitle: RegularText(l10n.changeTheme),
          trailing: Icon(
            state.theme == AppTheme.light
                ? Icons.sunny
                : Icons.mode_night_rounded,
            size: Dimens.dp28,
            color: context.theme.primaryColor,
          ),
          onTap: () {
            context.read<ThemeBloc>().add(
                  ThemeChanged(
                    state.theme == AppTheme.light
                        ? AppTheme.dark
                        : AppTheme.light,
                  ),
                );
          },
        );
      },
    );
  }
}
