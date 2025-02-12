import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/extension/string_extensions.dart';
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
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Total', style: StyleAsset.heading4Bold),
            const Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              RichText(
                text: TextSpan(
                  style: StyleAsset.paragraph1SemiBold
                      .copyWith(color: ColorAsset.black),
                  children: [
                    if (ctn != 0)
                      TextSpan(
                        style: StyleAsset.paragraph1SemiBold,
                        text: "$ctn",
                        children: [
                          TextSpan(
                            style: StyleAsset.paragraph1,
                            text: " CTN",
                          ),
                        ],
                      ),
                    if (ctn != 0 && pcs != 0)
                      TextSpan(
                        style: StyleAsset.paragraph1SemiBold,
                        text: " ● ",
                        children: const [],
                      ),
                    if (pcs != 0)
                      TextSpan(
                        style: StyleAsset.paragraph1SemiBold,
                        text: "$pcs",
                        children: [
                          TextSpan(
                            style: StyleAsset.paragraph1,
                            text: " PCS",
                            children: const [],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Text(
                '(${'$total'.thousandFormater()}) PCS',
                style: StyleAsset.paragraph3,
              ),
            ]),
          ]),
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
