import 'package:buku_masjid/core/core.dart';
import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    super.key,
    this.label,
    this.isRequired,
    this.desc,
  });

  final String? label;
  final bool? isRequired;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    if (label == null) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RegularText.semiboldSolid(context, label ?? ''),
            if (isRequired == true)
              SubTitleText(
                '*',
                style: TextStyle(color: context.theme.colorScheme.error),
              ),
            if (desc != null)
              Expanded(
                child: RegularText(
                  desc!,
                  align: TextAlign.end,
                  style: const TextStyle(fontSize: Dimens.dp12),
                ),
              ),
          ],
        ),
        Dimens.dp4.height,
      ],
    );
  }
}
