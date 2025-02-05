import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/ui_features/widgets/card/qr_card.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/show_qr.dart';
import 'package:magic_power_sales/ui_features/widgets/indicator/status_indicator.dart';
import 'package:magic_power_sales/ui_features/widgets/tile/product_tile.dart';

class DetailTransactionPage extends StatelessWidget {
  const DetailTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Transaksi"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Divider(
            color: ColorAsset.neutral80,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10),
                Text(
                  "Hari ini, 08:18",
                  style: StyleAsset.paragraph2.copyWith(
                    color: ColorAsset.neutral40,
                  ),
                ),
                Text(
                  "ABC123456",
                  style: StyleAsset.heading3SemiBold.copyWith(
                    color: ColorAsset.neutral70,
                  ),
                ),
                verticalSpace(10),
                const StatusIndicator(
                  status: StatusTransaction.notScanned,
                ),
                verticalSpace(20),
                QrCodeCard(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      useSafeArea: true,
                      isScrollControlled: true,
                      backgroundColor: ColorAsset.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      builder: (context) {
                        return const ShowQrDialog();
                      },
                    );
                  },
                ),
                verticalSpace(20),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            color: ColorAsset.semantic,
            child: Text(
              "Produk yang dibeli",
              style: StyleAsset.paragraph2SemiBold.copyWith(
                color: ColorAsset.neutral20,
              ),
            ),
          ),
          const ProductTile(
            padding: EdgeInsets.symmetric(horizontal: 20),
            title: "Black Parade",
            summary: true,
            withDivider: true,
          ),
          verticalSpace(10),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            color: ColorAsset.semantic,
            child: Text(
              "Total",
              style: StyleAsset.paragraph2SemiBold.copyWith(
                color: ColorAsset.neutral20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Classic",
                  style: StyleAsset.heading4Bold.copyWith(
                    color: ColorAsset.neutral70,
                  ),
                ),
                Text(
                  "3 CTN • 2 PCS",
                  style: StyleAsset.heading4Bold.copyWith(
                    color: ColorAsset.neutral70,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
