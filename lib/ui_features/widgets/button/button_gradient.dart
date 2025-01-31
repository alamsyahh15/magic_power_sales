import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/color_assets.dart';

import '../../../config/config.dart';

class ButtonGradient extends StatelessWidget {
  const ButtonGradient({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.isLoading,
  });

  final String label;
  final Function() onTap;
  final double? width;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? screenWidth(context),
        height: screenHeight(context) / 20.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [
              ColorAsset.primaryNegative10,
              ColorAsset.primary,
              ColorAsset.primaryNegative10
            ],
          ),
        ),
        alignment: Alignment.center,
        child: isLoading ?? false
            ? const CircularProgressIndicator()
            : Text(
                label,
                style: AssetStyles.textLgRegular.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorAsset.grey,
                  fontSize: screenHeight(context) / 62.4,
                ),
              ),
      ),
    );
  }
}
