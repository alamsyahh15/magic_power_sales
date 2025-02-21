import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/layout.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQrDialog extends StatelessWidget {
  const ShowQrDialog({
    super.key,
    required this.value,
    this.path,
  });
  final String value;
  final String? path;

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
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: ColorAsset.accent,
                    shape: BoxShape.circle,
                    image: path != null
                        ? DecorationImage(
                            image: NetworkImage(path!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                Text(
                  "${LocalDB.user.user?.fullName}",
                  textAlign: TextAlign.center,
                  style: StyleAsset.heading3SemiBold.copyWith(
                    color: ColorAsset.neutral70,
                  ),
                ),
                verticalSpace(10),
                QrImageView(
                  data: value,
                  size: 240,
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
