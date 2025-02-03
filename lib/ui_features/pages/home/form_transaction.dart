import 'package:flutter/material.dart' hide TextButton;
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/empty/empty.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class FormTransactionPage extends StatefulWidget {
  const FormTransactionPage({super.key});

  @override
  State<FormTransactionPage> createState() => _FormTransactionPageState();
}

class _FormTransactionPageState extends State<FormTransactionPage> {
  TextEditingController idDistributionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Catat Transaksi"),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          color: ColorAsset.semantic,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: StyleAsset.paragraph1SemiBold,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "0 CTN • 0 PCS",
                        style: StyleAsset.paragraph1.copyWith(
                          color: ColorAsset.neutral70,
                        ),
                      ),
                      Text(
                        "(0) PCS",
                        style: StyleAsset.paragraph2.copyWith(
                          color: ColorAsset.neutral70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(10),
              PrimaryButton(
                label: "Simpan",
                color: ColorAsset.primary,
                onTap: () {},
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              color: ColorAsset.semantic,
              child: Text(
                "Informasi Transaksi",
                style: StyleAsset.paragraph2SemiBold.copyWith(
                  color: ColorAsset.neutral20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldPrimary(
                    label: "ID Distributor",
                    labelStyle: StyleAsset.paragraph2,
                    controller: idDistributionController,
                    hintText: "Cth: 01",
                    gapLabel: 2,
                    fontSize: 20,
                    inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorAsset.neutralNegative80,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle: StyleAsset.heading4SemiBold,
                  ),
                  TextFieldPrimary(
                    label: "No. Faktur",
                    gapLabel: 2,
                    labelStyle: StyleAsset.paragraph2,
                    controller: idDistributionController,
                    hintText: "Cth: ABCD1234",
                    fontSize: 20,
                    inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorAsset.neutralNegative80,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle: StyleAsset.heading4SemiBold,
                  ),
                  TextFieldPrimary(
                    label: "Tanggal",
                    gapLabel: 2,
                    labelStyle: StyleAsset.paragraph2,
                    controller: idDistributionController,
                    hintText: "dd/mm/yy",
                    fontSize: 20,
                    inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorAsset.neutralNegative80,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle: StyleAsset.heading4SemiBold,
                  ),
                  TextFieldPrimary(
                    label: "Jatuh tempo",
                    gapLabel: 2,
                    labelStyle: StyleAsset.paragraph2,
                    controller: idDistributionController,
                    hintText: "dd/mm/yy",
                    fontSize: 20,
                    inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorAsset.neutralNegative80,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle: StyleAsset.heading4SemiBold,
                  ),
                  TextFieldPrimary(
                    label: "Kota",
                    gapLabel: 2,
                    labelStyle: StyleAsset.paragraph2,
                    controller: idDistributionController,
                    hintText: "Cth: Jakarta Selatan",
                    fontSize: 20,
                    inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorAsset.neutralNegative80,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle: StyleAsset.heading4SemiBold,
                  ),
                  verticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pembelian Produk",
                        style: StyleAsset.heading4SemiBold,
                      ),
                      PrimaryButton(
                        label: "Tambah",
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  const Empty(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
