import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/color_assets.dart';

import '../../../config/config.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.borderColor,
    this.textColor,
  });

  final String label;
  final Function() onTap;
  final double? width;
  final Color? borderColor, textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: borderColor == null
          ? ShaderMask(
              shaderCallback: (v) => ColorAsset.gradientColor.createShader(v),
              child: _buttonWIdget(context),
            )
          : _buttonWIdget(context),
    );
  }

  Container _buttonWIdget(BuildContext context) {
    return Container(
      width: width ?? screenWidth(context),
      height: screenHeight(context) / 20.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor ?? ColorAsset.primary),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: AssetStyles.textLgRegular.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor ?? ColorAsset.primary,
            fontSize: screenHeight(context) / 62.4),
      ),
    );
  }
}
