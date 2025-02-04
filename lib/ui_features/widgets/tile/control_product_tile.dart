import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/button/quantity_control.dart';

class ControlProductTile extends StatelessWidget {
  const ControlProductTile({
    super.key,
    this.onChanged,
    this.label,
    this.divider = false,
  });
  final Function(int)? onChanged;
  final String? label;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: divider
            ? Border(
                bottom: BorderSide(
                  color: ColorAsset.neutralNegative80,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label ?? "",
              style: StyleAsset.paragraph1SemiBold,
            ),
          ),
          Expanded(
            child: QuantityControl(
              onDecrease: (e) {
                if (onChanged != null) {
                  onChanged!(e);
                }
              },
              onIncrease: (e) {
                if (onChanged != null) {
                  onChanged!(e);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
