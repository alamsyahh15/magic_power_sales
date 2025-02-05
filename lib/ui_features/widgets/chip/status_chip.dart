import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    this.status = StatusTransaction.scanned,
  });
  final StatusTransaction status;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        status == StatusTransaction.notScanned ? "Not Scanned" : "Scanned",
        style: StyleAsset.paragraph3SemiBold.copyWith(
          color: status == StatusTransaction.notScanned
              ? ColorAsset.neutral20
              : ColorAsset.success50,
        ),
      ),
    );
  }
}
