import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/ui_features/widgets/chip/status_chip.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    this.label,
    this.ctn = 1,
    this.pcs = 1,
    this.status = StatusTransaction.scanned,
    this.onTap,
  });
  final Function()? onTap;
  final String? label;
  final StatusTransaction status;
  final int ctn, pcs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
              StatusChip(
                status: status,
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
      ),
    );
  }
}
