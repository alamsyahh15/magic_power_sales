import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';

class DividerText extends StatelessWidget {
  const DividerText({
    super.key,
    this.label,
  });
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      color: ColorAsset.semantic,
      child: Text(
        label ?? "",
        style: StyleAsset.paragraph2SemiBold.copyWith(
          color: ColorAsset.neutral20,
        ),
      ),
    );
  }
}
