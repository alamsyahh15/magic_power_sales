import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';

class TextButton extends StatelessWidget {
  const TextButton({
    super.key,
    this.onTap,
    this.label,
    this.textDecoration,
    this.colorDecoration,
  });
  final Function()? onTap;
  final String? label;
  final TextDecoration? textDecoration;
  final Color? colorDecoration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label ?? "",
        style: StyleAsset.paragraph2SemiBold.copyWith(
          color: ColorAsset.error20,
          decoration: textDecoration,
          decorationColor: colorDecoration ?? ColorAsset.primary,
        ),
      ),
    );
  }
}
