import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magic_power_sales/config/config.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    this.trailing,
    required this.title,
    required this.icon,
    this.style,
    this.divider = true,
    this.onTap,
  });
  final String title;
  final dynamic icon;
  final TextStyle? style;
  final Widget? trailing;
  final bool divider;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          border: divider
              ? Border(
                  bottom: BorderSide(
                    color: ColorAsset.neutralNegative80,
                  ),
                )
              : null,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          leading: icon is String ? SvgPicture.asset(icon) : icon,
          title: Text(
            title,
            style: style ??
                StyleAsset.paragraph1.copyWith(
                  color: ColorAsset.neutral70,
                ),
          ),
          trailing: trailing ??
              Icon(
                Icons.chevron_right_rounded,
                color: ColorAsset.neutral,
              ),
        ),
      ),
    );
  }
}
