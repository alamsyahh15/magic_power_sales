import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/layout.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQrDialog extends StatefulWidget {
  const ShowQrDialog({
    super.key,
    required this.value,
    this.path,
    required this.endCountdown,
  });
  final String value;
  final String? path;
  final DateTime endCountdown;

  @override
  State<ShowQrDialog> createState() => _ShowQrDialogState();
}

class _ShowQrDialogState extends State<ShowQrDialog> {
  Timer? timer;
  String countdown = "";

  String _formatDuration(Duration duration) {
    // int days = duration.inDays;
    // int hours = duration.inHours % 24;
    int minutes = duration.inMinutes % 60;
    int seconds = duration.inSeconds % 60;

    return "$minutes Menit :  $seconds Detik";
  }

  void initiateCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (tick) {
      DateTime now = DateTime.now();
      DateTime endTime = widget.endCountdown;
      Duration remainingTime = endTime.difference(now);
      if (remainingTime.isNegative) {
        countdown = "Telah Berakhir";
        timer?.cancel();
      } else {
        countdown = _formatDuration(remainingTime);
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initiateCountdown();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

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
                    image: widget.path != null
                        ? DecorationImage(
                            image: NetworkImage(widget.path!),
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
                  data: widget.value,
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
                const SizedBox(height: 16),
                Text(
                  "Waktu scan tinggal tersisa :",
                  style: StyleAsset.paragraph1.copyWith(
                    color: ColorAsset.neutral40,
                  ),
                ),
                Text(
                  countdown,
                  style: StyleAsset.paragraph1.copyWith(
                    color: ColorAsset.error30,
                  ),
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
