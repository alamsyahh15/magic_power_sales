import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/models/product.dart';
import 'package:magic_power_sales/config/repositories/main_repository.dart';
import 'package:magic_power_sales/ui_features/pages/home/models/product_model.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/image/asset_image.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class AddProductSheet extends StatefulWidget {
  const AddProductSheet({super.key});

  @override
  State<AddProductSheet> createState() => _AddProductSheetState();
}

class _AddProductSheetState extends State<AddProductSheet> {
  TextEditingController qtyC = TextEditingController();
  TextEditingController qtyP = TextEditingController();
  List<Product> products = [];
  int perKarton = 420; // Real 420
  int anyPerKarton = 240;
  int? typeId;
  String? imageUrl;
  int? qty;
  String? errorText;

  void initialized() async {
    final result = await MainRepository.getProducts();
    products = result;
    setState(() {});
  }

  void calculateCartonToQty() {
    qty = 0;
    errorText = null;
    if (typeId != null) {
      // Counting qty karton
      int qtyCarton = int.tryParse(qtyC.text) ?? 0;
      if (typeId != 3) {
        qty = (qty ?? 0) + qtyCarton * perKarton;
      } else {
        qty = (qty ?? 0) + qtyCarton * anyPerKarton;
      }

      // Counting qty piece
      int qtyPieces = int.tryParse(qtyP.text) ?? 0;
      if (typeId != 3) {
        if (qtyPieces > (perKarton - 1)) {
          errorText = "*Perhatian quantity harus kurang dari $perKarton";
        } else {
          qty = (qty ?? 0) + qtyPieces;
        }
      } else {
        if (qtyPieces > (anyPerKarton - 1)) {
          errorText = "*Perhatian quantity harus kurang dari $anyPerKarton";
        } else {
          qty = (qty ?? 0) + qtyPieces;
        }
      }
    }
    log("Qty -> $qty");
    setState(() {});
  }

  @override
  void initState() {
    initialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool valid = typeId != null && qty != null && (qty ?? 0) > 0;
    return Container(
      width: screenWidth(context),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: screenWidth(context) / 10,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                "Tambah Produk",
                style: StyleAsset.heading4Bold.copyWith(
                  color: ColorAsset.primary,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Produk"),
                  Container(
                    height: 52,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int?>(
                        value: typeId,
                        icon: const MPAssetImage(
                          "$assetIcon/ic_keyboard_arrow_down.svg",
                          width: 20,
                          color: Colors.black,
                        ),
                        hint: Text(
                          'Pilih jenis produk',
                          style: StyleAsset.paragraph1SemiBold.copyWith(
                            color: ColorAsset.fgQuinary,
                            fontSize: screenHeight(context) / 62.4,
                          ),
                        ),
                        items: products.map((value) {
                          return DropdownMenuItem<int?>(
                            value: value.id,
                            child: Text(
                              "${value.name}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          final type = products.where((e) => e.id == value);
                          if (type.isNotEmpty) {
                            imageUrl = type.first.image?.url;
                          }
                          log("Image Url -> $imageUrl $value");
                          typeId = value;
                          calculateCartonToQty();
                        },
                      ),
                    ),
                  ),
                  const Divider(thickness: 0.5, height: 0),
                ],
              ),
              const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Jumlah (CTN)"),
                  TextFieldPrimary(
                    hintText: '0',
                    controller: qtyC,
                    inputBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    fontSize: 20,
                    keyboardType: TextInputType.number,
                    onEditingComplete: () => calculateCartonToQty(),
                    onChanged: (value) {
                      value = value?.replaceAll(".", "");
                      calculateCartonToQty();
                    },
                  ),
                  const Divider(thickness: 0.5, height: 0),
                ],
              ),
              const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Jumlah (PCS)"),
                  TextFieldPrimary(
                    hintText: '0',
                    controller: qtyP,
                    inputBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    fontSize: 20,
                    keyboardType: TextInputType.number,
                    onEditingComplete: () => calculateCartonToQty(),
                    onChanged: (value) {
                      value = value?.replaceAll(".", "");
                      calculateCartonToQty();
                    },
                  ),
                  const Divider(thickness: 0.5, height: 0),
                ],
              ),
              if (errorText != null)
                Text(
                  "$errorText",
                  style: StyleAsset.paragraph3.copyWith(
                    color: Colors.red,
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: StyleAsset.paragraph2SemiBold),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: StyleAsset.paragraph2SemiBold.copyWith(
                            color: ColorAsset.black,
                          ),
                          text: qtyC.text,
                          children: [
                            TextSpan(
                              style: StyleAsset.paragraph2,
                              text: " CTN",
                              children: const [],
                            ),
                            TextSpan(
                              style: StyleAsset.paragraph2SemiBold,
                              text: " ● ${qtyP.text}",
                              children: const [],
                            ),
                            TextSpan(
                              style: StyleAsset.paragraph2,
                              text: " PCS",
                              children: const [],
                            ),
                          ],
                        ),
                      ),
                      Text("(${qty ?? 0}) PCS")
                    ],
                  )
                ],
              ),
              PrimaryButton(
                label: "Tambah",
                color: valid ? ColorAsset.primary : Colors.grey,
                onTap: () {
                  if (valid) {
                    backScreen(ProductModel(
                      imageUrl: imageUrl,
                      perKarton: perKarton,
                      qty: qty,
                      typeId: typeId,
                      calKarton: int.tryParse(qtyC.text),
                      calPieces: int.tryParse(qtyP.text),
                    ));
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
