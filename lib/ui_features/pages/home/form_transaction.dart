import 'package:flutter/material.dart' hide TextButton;
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/bottom/bottom_navigation.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/add_product.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';
import 'package:magic_power_sales/ui_features/widgets/tile/product_tile.dart';

class FormTransactionPage extends StatefulWidget {
  const FormTransactionPage({super.key});

  @override
  State<FormTransactionPage> createState() => _FormTransactionPageState();
}

class _FormTransactionPageState extends State<FormTransactionPage> {
  TextEditingController idDistributionController = TextEditingController(),
      factureController = TextEditingController();
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
        bottomNavigationBar: BottomNavigation(
          onTap: () {},
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
                    controller: factureController,
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
                  verticalSpace(20),
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
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            useSafeArea: true,
                            isScrollControlled: true,
                            backgroundColor: ColorAsset.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            builder: (context) {
                              return AddProduct(
                                onTap: () {},
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  // const Empty(),
                  ProductTile(
                    title: "ada",
                    onDelete: () {},
                  ),
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
                "Ringkasan",
                style: StyleAsset.paragraph2SemiBold.copyWith(
                  color: ColorAsset.neutral20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTile(
                    title: "ada",
                    summary: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
