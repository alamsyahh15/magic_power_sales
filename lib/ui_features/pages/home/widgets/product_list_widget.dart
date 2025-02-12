import 'dart:io';

import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/models/product.dart';
import 'package:magic_power_sales/config/repositories/main_repository.dart';
import 'package:magic_power_sales/extension/string_extensions.dart';
import 'package:magic_power_sales/ui_features/pages/home/models/product_model.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/image/asset_image.dart';

class ProductListWidget extends StatefulWidget {
  final List<ProductModel> listProduct;
  final Function(ProductModel) onDelete;
  final Function() onAdd;
  const ProductListWidget({
    super.key,
    required this.onDelete,
    required this.onAdd,
    required this.listProduct,
  });

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  List<Product> products = [];
  void initialized() async {
    final result = await MainRepository.getProducts();
    products = result;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialized();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorAsset.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Text(
              'Pembelian Produk',
              style: StyleAsset.paragraph1SemiBold,
            ),
          ),
          const SizedBox(width: 8),
          PrimaryButton(
            width: 85,
            height: 32,
            color: ColorAsset.primary,
            label: "Tambah",
            fontStyle: StyleAsset.paragraph3Bold.copyWith(
              color: Colors.white,
            ),
            onTap: widget.onAdd,
          ),
        ]),
        if (widget.listProduct.isEmpty) ...[
          const SizedBox(height: 24),
          const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                MPAssetImage("$assetIcon/ic_empty.svg"),
                Text(
                  "Klik tombol tambah untuk menambahkan produk\nsesuai faktur",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 16),
        if (widget.listProduct.isNotEmpty)
          ...widget.listProduct.reversed.toList().map((e) {
            TextEditingController qtyC = TextEditingController();
            qtyC.text = '${e.qty ?? ''}'.thousandFormater();
            qtyC.selection = TextSelection.collapsed(offset: qtyC.text.length);
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      width: 64,
                      height: 64,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.withAlpha(100),
                      ),
                      child: Visibility(
                        visible: (e.image == null && e.imageUrl == null),
                        replacement: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: e.image != null
                              ? Image.file(
                                  e.image ?? File(''),
                                  fit: BoxFit.contain,
                                )
                              : Image.network(
                                  formatPhotoUrl("${e.imageUrl}"),
                                  fit: BoxFit.contain,
                                ),
                        ),
                        child: Icon(
                          Icons.image,
                          color: ColorAsset.secondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${products.where((prod) => prod.id == e.typeId).firstOrNull?.name}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          e.calKarton == null
                              ? "${e.calPieces ?? 0} PCS"
                              : e.calPieces == null
                                  ? "${e.calKarton} CTN "
                                  : '${e.calKarton} CTN • ${e.calPieces ?? 0} PCS',
                          style: StyleAsset.paragraph2,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => widget.onDelete(e),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Hapus',
                        style: StyleAsset.paragraph3Bold
                            .copyWith(color: ColorAsset.primary),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
      ]),
    );
  }
}
