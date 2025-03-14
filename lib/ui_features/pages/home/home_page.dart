import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/providers/transaction/transaction.dart';
import 'package:magic_power_sales/extension/string_extensions.dart';
import 'package:magic_power_sales/ui_features/pages/home/detail_transaction.dart';
import 'package:magic_power_sales/ui_features/pages/home/form_transaction.dart';
import 'package:magic_power_sales/ui_features/widgets/card/transaction_card.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';
import 'package:magic_power_sales/ui_features/widgets/tile/transaction_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int perKarton = 420;
  int anyPerKarton = 240;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TransactionProvider>().getTransaction();
    });
  }

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<TransactionProvider>();
    return RefreshIndicator(
      onRefresh: () async {
        await prov.init();
      },
      child: ListView(
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
                  text: (LocalDB.user.user?.fullName ?? "").firstName(),
                  style: StyleAsset.heading3SemiBold.copyWith(
                    color: ColorAsset.primary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            // "Kamis, 26 Desember 2024",
            DateFormat("EEEE, d MMMM y", "id_ID").format(DateTime.now()),
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
            suffixIcon: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: "all",
                    child: Text("Semua"),
                  ),
                  PopupMenuItem(
                    value: "not-scanned",
                    child: Text(
                      "Not Scanned",
                      style: TextStyle(color: ColorAsset.primary),
                    ),
                  ),
                  PopupMenuItem(
                    value: "scanned",
                    child: Text(
                      "Scanned",
                      style: TextStyle(color: ColorAsset.success50),
                    ),
                  ),
                ];
              },
              onSelected: (val) {
                prov.searchOrFilter(sortBy: val);
              },
              icon: SvgPicture.asset(
                Assets.filterList,
              ),
              color: ColorAsset.white,
            ),
            radius: 12,
            hintText: "Cari transaksi",
            onChanged: (val) {
              if (val != null) prov.searchOrFilter(q: val);
            },
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
          ...prov.transactions.reversed.map((data) {
            int calculationCarton = 0;
            int calculationPcs = 0;
            for (int i = 0; i < data.products.length; i++) {
              final product = data.products[i].product;
              if (product?.id != 3) {
                calculationCarton += data.products[i].count! ~/ perKarton;
                calculationPcs += data.products[i].count! % perKarton;
              } else {
                calculationCarton += data.products[i].count! ~/ anyPerKarton;
                calculationPcs += data.products[i].count! % anyPerKarton;
              }
            }
            return TransactionTile(
              label: data.noInvoice,
              date: data.fakturDate?.toIso8601String(),
              status: data.status,
              ctn: calculationCarton,
              merchantName: data.merchant?.fullName,
              pcs: calculationPcs,
              onTap: () {
                nextScreen(DetailTransactionPage(transaction: data));
              },
            );
          }),
        ],
      ),
    );
  }
}
