import 'package:flutter/material.dart';

import 'asset_image.dart';
import 'network_image.dart';

class ImageLoader extends StatelessWidget {
  final String src;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Widget? placeholderWidget;
  final Widget? errorWidget;
  final Color? color;
  final double? defaultErrorIconSize;
  final Alignment? alignment;
  final bool emptyErrorWidget;
  final bool emptyPlaceholderWidget;
  final bool emptyProgressWidget;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final double? scale;
  final AlignmentGeometry? svgAlignment;
  const ImageLoader({
    super.key,
    required this.src,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholderWidget,
    this.errorWidget,
    this.color,
    this.defaultErrorIconSize = 24,
    this.alignment,
    this.emptyErrorWidget = false,
    this.emptyPlaceholderWidget = false,
    this.emptyProgressWidget = false,
    this.radius = 0,
    this.borderRadius,
    this.scale,
    this.svgAlignment,
  });

  @override
  Widget build(BuildContext context) {
    if (src.contains("http://") || src.contains("https://")) {
      return MPNetworkImage(
        src,
        alignment: alignment,
        borderRadius: borderRadius,
        color: color,
        defaultErrorIconSize: defaultErrorIconSize,
        emptyErrorWidget: emptyErrorWidget,
        emptyPlaceholderWidget: emptyPlaceholderWidget,
        emptyProgressWidget: emptyProgressWidget,
        errorWidget: errorWidget,
        fit: fit,
        height: height,
        placeholderWidget: placeholderWidget,
        radius: radius,
        width: width,
      );
    }
    return MPAssetImage(
      src,
      alignment: alignment,
      color: color,
      fit: fit,
      height: height,
      radius: radius,
      scale: scale,
      svgAlignment: svgAlignment,
      width: width,
    );
  }
}
