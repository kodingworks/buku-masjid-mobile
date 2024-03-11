import 'package:flutter/material.dart';
import 'package:buku_masjid/core/core.dart';

class CardBorder extends StatelessWidget {
  const CardBorder({
    super.key,
    required this.child,
    this.borderRadius,
    this.onTap,
    this.isActive = false,
    this.height,
    this.width,
    this.padding,
  });

  final Widget child;
  final BorderRadius? borderRadius;
  final Function()? onTap;
  final bool isActive;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onTap: onTap,
      borderRadius: borderRadius ?? BorderRadius.circular(Dimens.dp8),
      child: Container(
        width: width,
        height: height,
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: Dimens.dp12,
              vertical: Dimens.dp8,
            ),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          border: Border.all(
            color: isActive
                ? context.theme.primaryColor
                : context.theme.dividerColor,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(Dimens.dp8),
        ),
        child: child,
      ),
    );
  }
}
