import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/color_assets.dart';

class LayoutDialog extends StatelessWidget {
  const LayoutDialog({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        child ?? const SizedBox(),
        Positioned(
          top: 10,
          child: Container(
            height: 5,
            width: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorAsset.fgQuinary,
            ),
          ),
        ),
      ],
    );
  }
}
