import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';

class AppBarPrimary extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPrimary({
    super.key,
    this.title = '',
    this.actions,
    this.backgroundColor = Colors.white,
    this.textColor,
    this.onTapBack,
    this.centerTitle,
    this.textStyle,
    this.elevation = 0,
  });

  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onTapBack;
  final bool? centerTitle;
  final TextStyle? textStyle;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle ?? false,
      automaticallyImplyLeading: false,
      leadingWidth: 40,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      actions: actions,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTapBack ?? () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: textColor),
        ),
      ),
      title: GestureDetector(
        onTap: title == 'Kembali' ? () => Navigator.pop(context) : null,
        child: Text(
          title,
          style:
              textStyle ?? StyleAsset.heading4Bold.copyWith(color: textColor),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
