import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    this.label,
    this.ctn = 1,
    this.pcs = 1,
    this.status = StatusTransaction.scanned,
  });
  final String? label;
  final StatusTransaction status;
  final int ctn, pcs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label ?? "",
              style: StyleAsset.paragraph1SemiBold.copyWith(
                color: ColorAsset.neutral70,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: status == StatusTransaction.notScanned
                    ? ColorAsset.neutral90
                    : ColorAsset.success,
                border: Border.all(
                  color: status == StatusTransaction.notScanned
                      ? ColorAsset.neutralNegative40
                      : ColorAsset.success10,
                ),
              ),
              child: Text(
                status == StatusTransaction.notScanned
                    ? "Not Scanned"
                    : "Scanned",
                style: StyleAsset.paragraph3SemiBold.copyWith(
                  color: status == StatusTransaction.notScanned
                      ? ColorAsset.neutral20
                      : ColorAsset.success50,
                ),
              ),
            ),
          ],
        ),
        Text(
          "$ctn CTN • $pcs PCS",
          style: StyleAsset.paragraph2.copyWith(
            color: ColorAsset.neutral70,
          ),
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ABCAD",
              style: StyleAsset.paragraph2.copyWith(
                color: ColorAsset.neutral70,
              ),
            ),
            Text(
              "Hari ini",
              style: StyleAsset.paragraph2.copyWith(
                color: ColorAsset.neutral,
              ),
            ),
          ],
        ),
        verticalSpace(10),
        Divider(
          color: ColorAsset.neutralNegative80,
        ),
        verticalSpace(10),
      ],
    );
  }
}
