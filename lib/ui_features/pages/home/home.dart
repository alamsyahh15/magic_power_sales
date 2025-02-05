import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/ui_features/pages/home/detail_transaction.dart';
import 'package:magic_power_sales/ui_features/pages/home/form_transaction.dart';
import 'package:magic_power_sales/ui_features/widgets/card/transaction_card.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';
import 'package:magic_power_sales/ui_features/widgets/tile/transaction_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: ColorAsset.accent,
            shape: BoxShape.circle,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Divider(
            color: ColorAsset.neutral80,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.notificationOutline),
          ),
          horizontalSpace(10),
        ],
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        children: [
          Text.rich(
            TextSpan(
              text: "Selamat datang ",
              style: StyleAsset.heading3SemiBold,
              children: [
                TextSpan(
                  text: "Erik",
                  style: StyleAsset.heading3SemiBold.copyWith(
                    color: ColorAsset.primary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Kamis, 26 Desember 2024",
            style: StyleAsset.paragraph3.copyWith(
              color: ColorAsset.neutral,
            ),
          ),
          verticalSpace(20),
          TransactionCard(
            onTap: () {
              nextScreen(const FormTransactionPage());
            },
          ),
          verticalSpace(20),
          TextFieldPrimary(
            isRaw: true,
            prefixIcon: Icon(
              Icons.search_rounded,
              color: ColorAsset.neutral,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.filterList,
              ),
            ),
            radius: 12,
            hintText: "Cari transaksi",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Riwayat Transaksi",
              style: StyleAsset.paragraph2SemiBold.copyWith(
                color: ColorAsset.neutral70,
              ),
            ),
          ),
          TransactionTile(
            label: "ABCD1234",
            onTap: () {
              nextScreen(const DetailTransactionPage());
            },
            status: StatusTransaction.notScanned,
          ),
        ],
      ),
    );
  }
}
