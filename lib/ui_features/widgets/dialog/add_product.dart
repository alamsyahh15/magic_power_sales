import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/bottom/bottom_navigation.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/layout.dart';
import 'package:magic_power_sales/ui_features/widgets/dropdown/primary_dropdown.dart';
import 'package:magic_power_sales/ui_features/widgets/tile/control_product_tile.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return LayoutDialog(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Tambah Produk",
                    style: StyleAsset.heading4Bold.copyWith(
                      color: ColorAsset.primary,
                    ),
                  ),
                  verticalSpace(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorAsset.secondary,
                        ),
                      ),
                      horizontalSpace(15),
                      Expanded(
                        child: PrimaryDropdown(
                          onTap: (e) {},
                          isRaw: true,
                          hintText: "Pilih produk",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              color: ColorAsset.semantic,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Unit",
                      style: StyleAsset.paragraph2SemiBold.copyWith(
                        color: ColorAsset.neutral20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Qty",
                      style: StyleAsset.paragraph2SemiBold.copyWith(
                        color: ColorAsset.neutral20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var i = 0; i < 2; i++)
                    ControlProductTile(
                      onChanged: (e) {},
                      label: "ABCD1234",
                      divider: i < 1,
                    ),
                ],
              ),
            ),
            verticalSpace(10),
            BottomNavigation(
              label: "Tambah",
              onTap: () {
                backScreen();
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              backgroundColor: ColorAsset.white,
            ),
          ],
        ),
      ),
    );
  }
}
