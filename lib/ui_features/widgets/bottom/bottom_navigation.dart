import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    this.total = 0,
    this.backgroundColor,
    this.pcs = 0,
    this.ctn = 0,
    this.onTap,
    this.label,
  });
  final int total, pcs, ctn;
  final Function()? onTap;
  final Color? backgroundColor;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorAsset.semantic,
        border: Border(
          top: BorderSide(
            color: ColorAsset.secondary,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: StyleAsset.paragraph1SemiBold,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$ctn CTN • $pcs PCS",
                    style: StyleAsset.paragraph1.copyWith(
                      color: ColorAsset.neutral70,
                    ),
                  ),
                  Text(
                    "($pcs) PCS",
                    style: StyleAsset.paragraph2.copyWith(
                      color: ColorAsset.neutral70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(10),
          PrimaryButton(
            label: label ?? "Simpan",
            color: ColorAsset.primary,
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
          ),
        ],
      ),
    );
  }
}
