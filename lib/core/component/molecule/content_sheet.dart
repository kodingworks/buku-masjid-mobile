import 'package:buku_masjid/core/core.dart';
import 'package:flutter/material.dart';

class ContentSheet extends StatelessWidget {
  const ContentSheet({
    super.key,
    required this.content,
    this.height,
    this.expandContent = true,
    this.isIndicator = true,
  });

  final Widget content;
  final double? height;
  final bool expandContent;
  final bool isIndicator;

  @override
  Widget build(BuildContext context) {
    if (expandContent == true) {
      return AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isIndicator) _buildIndicator(context),
              Expanded(
                child: content,
              ),
            ],
          ),
        ),
      );
    } else {
      return AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isIndicator) _buildIndicator(context),
            content,
          ],
        ),
      );
    }
  }

  Widget _buildIndicator(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: Dimens.dp8),
          width: 26,
          height: 4,
          decoration: BoxDecoration(
            color: context.adaptiveTheme.disabledColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(Dimens.dp4),
          ),
        ),
      ],
    );
  }
}
