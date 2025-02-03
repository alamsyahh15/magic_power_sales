import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magic_power_sales/config/config.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.noData,
        ),
        verticalSpace(10),
        Text(
          "Klik tombol tambah untuk menambahkan produk sesuai faktur",
          style: StyleAsset.paragraph2.copyWith(
            color: ColorAsset.neutral70,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
