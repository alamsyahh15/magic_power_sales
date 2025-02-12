import 'package:flutter/material.dart' hide TextButton;
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/button/text_button.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    this.onDelete,
    this.pcs = 0,
    this.title,
    this.ctn = 0,
    this.withDivider = false,
    this.summary = false,
    this.padding = EdgeInsets.zero,
    this.imageUrl,
  });
  final Function()? onDelete;
  final String? title;
  final String? imageUrl;
  final int ctn, pcs;
  final bool withDivider, summary;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: imageUrl != null
                ? Container(
                    height: 70,
                    width: 60,
                    decoration: BoxDecoration(
                      color: ColorAsset.secondary,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl!),
                      ),
                    ),
                  )
                : null,
            title: Text(
              title ?? "-",
              style: StyleAsset.paragraph2SemiBold,
            ),
            subtitle: !summary
                ? Text(
                    "$ctn CTN • $pcs PCS",
                    style: StyleAsset.paragraph2,
                  )
                : null,
            trailing: summary
                ? Text(
                    "$ctn CTN • $pcs PCS",
                    style: StyleAsset.paragraph2,
                  )
                : TextButton(
                    label: "Hapus",
                    onTap: onDelete,
                  ),
          ),
          if (withDivider)
            Divider(
              color: ColorAsset.neutralNegative80,
            ),
        ],
      ),
    );
  }
}
