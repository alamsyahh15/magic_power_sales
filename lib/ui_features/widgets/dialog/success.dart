import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/layout.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    this.description,
    this.title,
  });
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
          SvgPicture.asset(Assets.success),
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
          verticalSpace(30),
          PrimaryButton(
            label: "Kembali",
            onTap: () {
              backScreen();
              backScreen();
            },
          ),
        ],
      ),
    );
  }
}
