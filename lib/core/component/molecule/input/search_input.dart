import 'package:buku_masjid/core/core.dart';
import 'package:flutter/material.dart';

class SearchTextInput extends StatelessWidget {
  const SearchTextInput({
    super.key,
    required this.controller,
    this.hintText,
    this.onClear,
    this.onChanged,
    this.onSubmit,
    this.readOnly,
    this.onTap,
    this.focusNode,
    this.autoFocus,
    this.enable = true,
    this.suffixColor,
  });

  final TextEditingController controller;
  final String? hintText;
  final VoidCallback? onClear;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final bool? readOnly;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool? autoFocus;
  final bool enable;
  final Color? suffixColor;

  @override
  Widget build(BuildContext context) {
    return RegularInput(
      focusNode: focusNode,
      controller: controller,
      onChange: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      autoFocus: autoFocus,
      onSubmit: onSubmit,
      enable: enable,
      suffix: controller.text.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.clear),
              color: suffixColor,
              onPressed: () {
                controller.clear();
                onClear?.call();
                onChanged?.call('');
              },
            )
          : null,
      prefix: const Icon(AppIcons.bigSearch),
      hintText: hintText,
    );
  }
}
