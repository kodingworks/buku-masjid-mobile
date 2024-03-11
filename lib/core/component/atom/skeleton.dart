import 'package:flutter/material.dart';
import 'package:buku_masjid/core/core.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.backgroundColor,
    this.width,
    this.height,
    this.radius,
    this.borderRadius,
  });

  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 4),
        color: backgroundColor ?? context.theme.disabledColor.withOpacity(.5),
      ),
    );
  }
}
