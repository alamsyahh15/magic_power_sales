import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';

class QuantityControl extends StatelessWidget {
  const QuantityControl(
      {super.key, this.value = 0, this.onDecrease, this.onIncrease});
  final int value;
  final Function(int)? onIncrease, onDecrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: InkWell(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            onTap: () {
              if (onDecrease != null) {
                int value = this.value;
                onDecrease!(value--);
              }
            },
            child: Ink(
              height: 40,
              padding: const EdgeInsets.all(
                7,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorAsset.borderPrimary,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: FittedBox(
                child: Icon(
                  Icons.remove_rounded,
                  color: ColorAsset.borderPrimary,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: ColorAsset.borderPrimary,
                ),
                bottom: BorderSide(
                  color: ColorAsset.borderPrimary,
                ),
              ),
            ),
            child: Text(
              value.toString(),
              style: StyleAsset.paragraph2SemiBold,
            ),
          ),
        ),
        Flexible(
          child: InkWell(
            onTap: () {
              if (onIncrease != null) {
                int value = this.value;
                onIncrease!(value++);
              }
            },
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            child: Ink(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorAsset.borderPrimary,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              height: 40,
              child: FittedBox(
                child: Icon(
                  Icons.add_rounded,
                  color: ColorAsset.fgBorderPrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
