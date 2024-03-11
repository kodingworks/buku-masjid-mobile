import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:buku_masjid/core/core.dart';

class OtpTextInput extends StatelessWidget {
  const OtpTextInput({
    super.key,
    required this.length,
    this.controller,
    this.label,
    this.isRequired,
  });
  final int length;
  final TextEditingController? controller;
  final String? label;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InputLabel(
          label: label,
          isRequired: isRequired,
        ),
        AutofillGroup(
          child: TextFormField(
            controller: controller,
            autofillHints: const <String>[AutofillHints.oneTimeCode],
            autocorrect: false,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(length),
            ],
            style: context.theme.textTheme.headlineLarge?.copyWith(
              letterSpacing: Dimens.dp8,
            ),
            enableInteractiveSelection: false,
            showCursor: false,
            decoration: InputDecoration(
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: Dimens.dp18,
                    height: Dimens.dp18,
                    child: CircularProgressIndicator(),
                  ),
                  Dimens.dp8.width,
                  const SubTitleText('00:27'),
                ],
              ),
              hintText: '●●●●',
              hintStyle: context.theme.textTheme.bodyMedium?.copyWith(
                letterSpacing: Dimens.dp8,
                color: context.theme.disabledColor,
              ),
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: context.theme.disabledColor,
                ),
              ),
              fillColor: Colors.transparent,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: context.theme.disabledColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.theme.primaryColor),
              ),
              disabledBorder: const UnderlineInputBorder(),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.theme.colorScheme.error),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.theme.primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
