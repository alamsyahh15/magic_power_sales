import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';

class LayoutDialog extends StatelessWidget {
  const LayoutDialog({
    super.key,
    this.child,
    this.padding,
  });
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: padding ?? const EdgeInsets.only(top: 20),
            child: child ?? const SizedBox(),
          ),
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
      ),
    );
  }
}
