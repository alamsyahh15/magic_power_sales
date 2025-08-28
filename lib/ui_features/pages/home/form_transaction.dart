// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart' hide TextButton;
import 'package:intl/intl.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/models/distributor.dart';
import 'package:magic_power_sales/config/providers/transaction/transaction.dart';
import 'package:magic_power_sales/extension/list_extension.dart';
import 'package:magic_power_sales/extension/string_extensions.dart';
import 'package:magic_power_sales/ui_features/pages/home/widgets/product_list_widget.dart';
import 'package:magic_power_sales/ui_features/pages/home/widgets/summary_widget.dart';
import 'package:magic_power_sales/ui_features/widgets/bottom/bottom_navigation.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/add_product.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/confirm.dart';
import 'package:magic_power_sales/ui_features/widgets/divider/divider_text.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';
import 'package:provider/provider.dart';

import 'models/product_model.dart';

class FormTransactionPage extends StatefulWidget {
  const FormTransactionPage({super.key});

  @override
  State<FormTransactionPage> createState() => _FormTransactionPageState();
}

class _FormTransactionPageState extends State<FormTransactionPage> {
  int perKarton = 420;
  int anyPerKarton = 240;
  TextEditingController factureController = TextEditingController();
  TextEditingController idDistributionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String? distributorErrorText;
  List<ProductModel> listProduct = [];

  void storeTransaction(Map<String, int> calculation) async {
    // final mainProv = context.read<MainProvider>();
    final dueDate = DateFormat("yyyy-MM-dd")
        .format(DateFormat('dd MMM yyyy').parse(dueDateController.text));
    final fakturDate = DateFormat("yyyy-MM-dd")
        .format(DateFormat('dd MMM yyyy').parse(dateController.text));

    if (listProduct.where((e) => e.typeId != null).isEmpty) {
      showInSnackBar("Silahkan masukan produk transaksi anda !");
      return;
    }

    Map<String, dynamic> params = {
      "distribution_id": idDistributionController.text.toUpperCase(),
      "no_invoice": factureController.text,
      "due_date": dueDate,
      "faktur_date": fakturDate,
      "total_price": int.tryParse(priceController.text),
      "city": cityController.text,
      "products": listProduct.map((e) {
        return {"product": e.typeId, "count": e.qty};
      }).toList()
        ..removeWhere((e) => isEmpty(e['count'])),
    };
    context.read<TransactionProvider>().createDraftTransaction(params);
  }

  bool valid() {
    final mainProv = context.read<TransactionProvider>();
    if (mainProv.distributors.isEmpty) {
      mainProv.distributors.add(Distributor(distributionId: "SA1"));
    }
    distributorErrorText = null;
    bool isFound = mainProv.distributors.any((distributor) =>
        "${distributor.distributionId}".toLowerCase() ==
        idDistributionController.text.toLowerCase());
    log("Distributor -> ${mainProv.distributors.map((e) => e.toJson())}");
    if (!isFound) {
      distributorErrorText = "ID Distributor tidak valid";
      setState(() {});
    }
    String price = priceController.text;
    if (idDistributionController.text.isEmpty) return false;
    if (factureController.text.isEmpty) return false;
    if (dateController.text.isEmpty) return false;
    if (dueDateController.text.isEmpty) return false;
    if (cityController.text.isEmpty) return false;
    if (price.isEmpty && price == "0") return false;
    if (listProduct.isEmpty || listProduct.first.qty == null) return false;

    return true && isFound;
  }

  Map<String, int> calculationKarton(List<Map<String, dynamic>> products) {
    String result = "";
    int totalQtyCart = products
        .where((e) => e['type_id'] != 3)
        .fold(0, (sum, product) => sum + ((product['qty'] as int?) ?? 0));
    int totalQtyAnyCart = products
        .where((e) => e['type_id'] == 3)
        .fold(0, (sum, product) => sum + ((product['qty'] as int?) ?? 0));

    int karton = 0;
    int pieces = 0;
    int pieceSpray = 0;
    int pieceTissue = 0;

    // Calculation karton
    if (totalQtyCart >= 420) {
      int res = (totalQtyCart ~/ perKarton);
      karton += res;
      pieceTissue = totalQtyCart - (res * perKarton);
      pieces += pieceTissue;
    } else {
      pieces += totalQtyCart;
      pieceTissue = totalQtyCart;
    }

    if (totalQtyAnyCart >= 240) {
      int res = (totalQtyAnyCart ~/ anyPerKarton);
      karton += res;
      pieceSpray = totalQtyAnyCart - (res * anyPerKarton);
      pieces += totalQtyAnyCart - (res * anyPerKarton);
    } else {
      pieces += totalQtyAnyCart;
      pieceSpray = totalQtyAnyCart;
    }
    result = "CTN $karton PCS $pieces";
    log("Result calculation $result");
    return {
      "karton": karton,
      "pieces": pieces,
      "piece_spray": pieceSpray,
      "piece_tissue": pieceTissue
    };
  }

  @override
  Widget build(BuildContext context) {
    final mainProv = context.read<TransactionProvider>();
    final qty = listProduct.fold(0, (sum, product) => sum + (product.qty ?? 0));
    List<Map<String, dynamic>> products = listProduct
        .removeDuplicates((p0) => p0.typeId)
        .map((e) => {
              "type_id": e.typeId,
              "qty": 0,
              "product_name": "",
              "cal_karton": 0,
              "cal_pieces": 0,
            })
        .toList();
    for (int i = 0; i < listProduct.length; i++) {
      final mainProduct =
          mainProv.mainProducts.where((e) => e.id == listProduct[i].typeId);
      final indexProduct =
          products.indexWhere((e) => e['type_id'] == listProduct[i].typeId);
      if (indexProduct >= 0 && mainProduct.isNotEmpty) {
        products[indexProduct]['product_name'] = mainProduct.first.name;
        products[indexProduct]['qty'] += (listProduct[i].qty ?? 0);
        products[indexProduct]['cal_karton'] += (listProduct[i].calKarton ?? 0);
        products[indexProduct]['cal_pieces'] += (listProduct[i].calPieces ?? 0);
      }
      if (products[indexProduct]['type_id'] != 3) {
        int calPieces = products[indexProduct]['cal_pieces'];
        if (products[indexProduct]['cal_pieces'] >= perKarton) {
          int res = calPieces ~/ perKarton;
          int remaining = calPieces - (res * perKarton);
          products[indexProduct]['cal_karton'] += res;
          products[indexProduct]['cal_pieces'] = remaining;
        }
      } else {
        if (products[indexProduct]['cal_pieces'] >= anyPerKarton) {
          int calPieces = products[indexProduct]['cal_pieces'];
          if (products[indexProduct]['cal_pieces'] >= perKarton) {
            int res = calPieces ~/ anyPerKarton;
            int remaining = calPieces - (res * anyPerKarton);
            products[indexProduct]['cal_karton'] += res;
            products[indexProduct]['cal_pieces'] = remaining;
          }
        }
      }
    }

    int currenTotal = 0;
    for (var product in listProduct) {
      final typeProduct =
          mainProv.mainProducts.where((e) => e.id == product.typeId);
      if (typeProduct.isNotEmpty) {
        int qty = product.qty ?? 0;
        int price = int.tryParse(typeProduct.first.price ?? "") ?? 0;
        currenTotal += (qty * price);
      }
    }
    priceController.text = currenTotal.toString();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Catat Transaksi")),
        bottomNavigationBar: BottomNavigation(
          ctn: calculationKarton(products)['karton'] as int,
          pcs: calculationKarton(products)['pieces'] as int,
          total: qty,
          onTap: () {
            if (valid()) {
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
                      storeTransaction(calculationKarton(products));
                    },
                  );
                },
              );
            } else {
              showInSnackBar("Pastikan anda melengkapi semua form");
            }
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
                    errorText: distributorErrorText,
                    hintText: "Cth: 01",
                    gapLabel: 2,
                    fontSize: 20,
                    errorBorder: InputBorder.none,
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
                  ProductListWidget(
                    listProduct: listProduct,
                    onDelete: (e) {
                      setState(() => listProduct.remove(e));
                    },
                    onAdd: () async {
                      final res = await showModalBottomSheet(
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
                      if (res != null) {
                        listProduct.add(res);
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
            const DividerText(label: "Ringkasan"),
            SummaryWidget(
              products: products,
              qty: qty,
              calculationKarton: calculationKarton(products),
              remainLabel: "",
            ),
          ],
        ),
      ),
    );
  }
}
