import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/color_assets.dart';
import 'package:magic_power_sales/config/config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.width,
    this.height,
    this.color,
    this.icon,
    this.isLoading = false,
    this.fontStyle,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.padding,
    this.textColor,
  });

  final String label;
  final Function() onTap;
  final double? width;
  final double? height;
  final Color? color, textColor;
  final Widget? icon;
  final bool isLoading;
  final TextStyle? fontStyle;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if (!isLoading) onTap();
        },
        child: Ink(
          width: width == null ? null : screenWidth(context),
          height: height ?? screenHeight(context) / 20.8,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color ?? ColorAsset.primary,
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: icon!,
                ),
              isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      label,
                      style: fontStyle ??
                          StyleAsset.paragraph2SemiBold.copyWith(
                            fontWeight: FontWeight.bold,
                            color: textColor ?? ColorAsset.white,
                            fontSize: screenHeight(context) / 62.4,
                          ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
