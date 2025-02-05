import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/layout.dart';

class ShowQrDialog extends StatelessWidget {
  const ShowQrDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutDialog(
      child: Column(
        children: [
          AppBar(
            leading: IconButton(
              onPressed: () {
                backScreen();
              },
              icon: Icon(
                Icons.close_rounded,
                color: ColorAsset.subtitle,
              ),
            ),
            title: const Text("Scan QR"),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.dummyQr,
                  height: 240,
                  width: 240,
                  fit: BoxFit.fitWidth,
                ),
                verticalSpace(10),
                Text(
                  "Scan kode QR berikut untuk mengisi data\npada Merchant App Anda secara otomatis",
                  style: StyleAsset.paragraph1.copyWith(
                    color: ColorAsset.neutral40,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: PrimaryButton(
              label: "Tutup",
              onTap: () {
                backScreen();
              },
            ),
          ),
        ],
      ),
    );
  }
}
