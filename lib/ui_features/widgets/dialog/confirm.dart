import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/layout.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    this.description,
    this.title,
    this.onTap,
  });
  final Function()? onTap;
  final String? title, description;

  @override
  Widget build(BuildContext context) {
    return LayoutDialog(
      padding: const EdgeInsets.only(
        top: 30,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? "",
            style: StyleAsset.heading3Bold.copyWith(
              color: ColorAsset.neutral70,
            ),
          ),
          verticalSpace(10),
          Text(
            description ?? "",
            style: StyleAsset.paragraph2.copyWith(
              color: ColorAsset.neutral70,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(20),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  label: "Kembali",
                  color: ColorAsset.white,
                  textColor: ColorAsset.primary,
                  onTap: () {},
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: PrimaryButton(
                  label: "Konfirmasi",
                  onTap: () {
                    backScreen();
                    if (onTap != null) {
                      onTap!();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
