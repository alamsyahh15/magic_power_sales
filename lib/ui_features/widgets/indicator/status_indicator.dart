import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/ui_features/widgets/chip/status_chip.dart';

class StatusIndicator extends StatelessWidget {
  const StatusIndicator({
    super.key,
    this.status = StatusTransaction.notScanned,
  });
  final StatusTransaction status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Status",
          style: StyleAsset.paragraph1.copyWith(
            color: ColorAsset.neutral70,
          ),
        ),
        StatusChip(
          status: status,
        ),
      ],
    );
  }
}
