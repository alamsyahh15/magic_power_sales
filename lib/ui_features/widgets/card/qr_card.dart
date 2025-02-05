import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magic_power_sales/config/config.dart';

class QrCodeCard extends StatelessWidget {
  const QrCodeCard({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        height: 120,
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: ColorAsset.accent35,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(Assets.showQr),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.qrcode,
                    colorFilter: ColorFilter.mode(
                      ColorAsset.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  horizontalSpace(5),
                  Text(
                    "Tampilkan QR",
                    style: StyleAsset.paragraph1SemiBold.copyWith(
                      color: ColorAsset.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
