import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magic_power_sales/config/config.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
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
        decoration: BoxDecoration(
          color: ColorAsset.error5,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: SvgPicture.asset(
                Assets.shape1,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                Assets.transaction,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Row(
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: ColorAsset.white,
                  ),
                  Text(
                    "Catat Transaksi",
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
