import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/models/transaction.dart';
import 'package:magic_power_sales/extension/string_extensions.dart';
import 'package:magic_power_sales/ui_features/widgets/card/qr_card.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/show_qr.dart';
import 'package:magic_power_sales/ui_features/widgets/divider/divider_text.dart';
import 'package:magic_power_sales/ui_features/widgets/indicator/status_indicator.dart';
import 'package:magic_power_sales/ui_features/widgets/tile/product_tile.dart';

class DetailTransactionPage extends StatelessWidget {
  final Transaction transaction;
  const DetailTransactionPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    int perKarton = 420;
    int anyPerKarton = 240;
    int calculationCarton = 0;
    int calculationPcs = 0;
    for (int i = 0; i < transaction.products.length; i++) {
      final product = transaction.products[i].product;
      if (product?.id != 3) {
        calculationCarton += transaction.products[i].count! ~/ perKarton;
        calculationPcs += transaction.products[i].count! % perKarton;
      } else {
        calculationCarton += transaction.products[i].count! ~/ anyPerKarton;
        calculationPcs += transaction.products[i].count! % anyPerKarton;
      }
    }

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
                  "${transaction.fakturDate}".formatDate(withTime: true),
                  style: StyleAsset.paragraph2.copyWith(
                    color: ColorAsset.neutral40,
                  ),
                ),
                Text(
                  "${transaction.noInvoice}",
                  style: StyleAsset.heading3SemiBold.copyWith(
                    color: ColorAsset.neutral70,
                  ),
                ),
                verticalSpace(10),
                StatusIndicator(status: transaction.status),
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
                        return ShowQrDialog(
                          path: formatPhotoUrl(
                              LocalDB.user.user?.profilePic?.url),
                          value: "${transaction.noInvoice}#${transaction.id}",
                        );
                      },
                    );
                  },
                ),
                verticalSpace(20),
              ],
            ),
          ),
          const DividerText(
            label: "Produk yang dibeli",
          ),
          ...transaction.products.map((data) {
            final product = data.product;
            int cartonTotal = 0;
            int pcsTotal = 0;

            if (product?.id != 3) {
              cartonTotal += data.count! ~/ perKarton;
              pcsTotal += data.count! % perKarton;
            } else {
              cartonTotal = data.count! ~/ anyPerKarton;
              pcsTotal += data.count! % anyPerKarton;
            }

            return ProductTile(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              title: data.product?.name,
              ctn: cartonTotal,
              pcs: pcsTotal,
              withDivider: true,
              summary: true,
            );
          }),
          verticalSpace(10),
          const DividerText(
            label: "Total",
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
                  "$calculationCarton CTN • $calculationPcs PCS",
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
