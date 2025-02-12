import 'package:flutter/material.dart' hide TextButton;
import 'package:intl/intl.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/extension/string_extensions.dart';
import 'package:magic_power_sales/ui_features/widgets/bottom/bottom_navigation.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/add_product.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/confirm.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/success.dart';
import 'package:magic_power_sales/ui_features/widgets/divider/divider_text.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';
import 'package:magic_power_sales/ui_features/widgets/tile/product_tile.dart';

import 'models/product_model.dart';

class FormTransactionPage extends StatefulWidget {
  const FormTransactionPage({super.key});

  @override
  State<FormTransactionPage> createState() => _FormTransactionPageState();
}

class _FormTransactionPageState extends State<FormTransactionPage> {
  TextEditingController factureController = TextEditingController();
  TextEditingController idDistributionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String? distributorErrorText;
  List<ProductModel> listProduct = [];

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
          onTap: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              backgroundColor: ColorAsset.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              builder: (context) {
                return ConfirmDialog(
                  title: "Catat transaksi?",
                  description:
                      "Periksa kembali transaksi Anda sebelum\nmelanjutkan",
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      useSafeArea: true,
                      backgroundColor: ColorAsset.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      builder: (context) {
                        return const SuccessDialog(
                          title: "Transaksi berhasil dicatat",
                          description: "Silahkan kembali ke aplikasi",
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
        body: ListView(
          children: [
            const DividerText(
              label: "Informasi Transaksi",
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
                    controller: dateController,
                    hintText: "dd/mm/yy",
                    fontSize: 20,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        dateController.text =
                            date.toString().formatDate(plainDate: true);
                      }
                    },
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
                    controller: dueDateController,
                    hintText: "dd/mm/yy",
                    fontSize: 20,
                    inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorAsset.neutralNegative80,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    hintStyle: StyleAsset.heading4SemiBold,
                    onTap: () async {
                      if (dateController.text.isEmpty) {
                        showInSnackBar("Silahkan masukan tanggal anda!");
                        return;
                      }
                      final firstDate =
                          DateFormat('dd MMM yyyy').parse(dateController.text);
                      final date = await showDatePicker(
                        context: context,
                        initialDate: firstDate,
                        firstDate: DateTime(1900),
                        lastDate: firstDate.add(const Duration(days: 60)),
                      );
                      if (date != null) {
                        dueDateController.text =
                            date.toString().formatDate(plainDate: true);
                      }
                    },
                  ),
                  TextFieldPrimary(
                    label: "Kota",
                    gapLabel: 2,
                    labelStyle: StyleAsset.paragraph2,
                    controller: cityController,
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
                        onTap: () async {
                          await showModalBottomSheet(
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
                              return const AddProductSheet();
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
            const DividerText(
              label: "Ringkasan",
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
