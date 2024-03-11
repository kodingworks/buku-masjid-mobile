import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buku_masjid/core/core.dart';
import 'package:buku_masjid/features/settings/settings.dart';
import 'package:buku_masjid/l10n/l10n.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return ListTile(
          leading: Icon(
            Icons.public_rounded,
            color: context.theme.disabledColor,
          ),
          title: SubTitleText(l10n.languages),
          subtitle: RegularText(l10n.changeLanguage),
          trailing: Image.asset(
            MainAssets.pathLanguage(state.language?.code ?? ''),
            width: Dimens.dp28,
            height: Dimens.dp28,
          ),
          onTap: () {
            context.read<LanguageBloc>().add(LanguageSelect(state.language!));
            _showBottom();
          },
        );
      },
    );
  }

  void _showBottom() {
    showModalBottomSheet(
      context: context,
      builder: (context) => BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          final l10n = context.l10n;
          return ContentSheet(
            expandContent: false,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Dimens.dp16.height,
                Padding(
                  padding: const EdgeInsets.all(Dimens.dp16),
                  child: TitleText(l10n.chooseLanguage),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.dp16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = state.supportedLanguages[index];
                    return ListTile(
                      leading: SubTitleText(item.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state.languageSelect == item)
                            Icon(
                              AppIcons.tickSquare,
                              color: context.theme.primaryColor,
                            ),
                          Dimens.dp8.width,
                          Image.asset(
                            MainAssets.pathLanguage(item.code),
                            width: Dimens.dp28,
                            height: Dimens.dp28,
                          ),
                        ],
                      ),
                      onTap: () {
                        context.read<LanguageBloc>().add(LanguageSelect(item));
                      },
                    );
                  },
                  itemCount: state.supportedLanguages.length,
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimens.dp16),
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<LanguageBloc>()
                          .add(LanguageChanged(state.languageSelect!));
                      Navigator.pop(context);
                    },
                    child: Text(l10n.next),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
