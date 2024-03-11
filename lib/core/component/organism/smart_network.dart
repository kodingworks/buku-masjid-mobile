import 'package:buku_masjid/core/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SmartNetworkImage extends StatelessWidget {
  const SmartNetworkImage(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.radius,
  });

  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => CardBorder(
          width: width,
          height: height,
          borderRadius: radius ?? BorderRadius.zero,
          child: Icon(AppIcons.photo, color: context.theme.disabledColor),
        ),
        errorWidget: (context, url, error) => CardBorder(
          width: width,
          height: height,
          borderRadius: radius ?? BorderRadius.zero,
          child: Icon(AppIcons.photo, color: context.theme.disabledColor),
        ),
      ),
    );
  }
}
