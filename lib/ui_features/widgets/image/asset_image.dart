import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MPAssetImage extends StatelessWidget {
  const MPAssetImage(
    this.path, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.scale,
    this.alignment,
    this.svgAlignment,
    this.radius = 0,
  });

  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final double? scale;
  final AlignmentGeometry? svgAlignment;
  final Alignment? alignment;
  final double radius;

  @override
  Widget build(BuildContext context) {
    if (path.endsWith('svg')) {
      return SvgPicture.asset(
        path,
        height: height,
        width: width,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        fit: fit ?? BoxFit.contain,
        alignment: svgAlignment ?? Alignment.center,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        path,
        height: height,
        width: width,
        fit: fit,
        color: color,
        scale: scale,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }
}
