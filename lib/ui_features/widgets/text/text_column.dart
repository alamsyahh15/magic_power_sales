import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';

class TextColumn extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle, subtitleStyle;
  final int? maxLines;
  final bool useExpanded;
  final double? spacing;
  final int? progres;
  final int? total;
  const TextColumn({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.maxLines,
    this.useExpanded = true,
    this.spacing,
    this.progres,
    this.total,
  });

  const TextColumn.progress({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.maxLines,
    this.useExpanded = true,
    this.spacing,
    this.progres,
    this.total,
  });

  @override
  Widget build(BuildContext context) {
    if (useExpanded) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: spacing ?? 2,
          children: [
            Text(
              title,
              maxLines: maxLines,
              style: titleStyle ?? StyleAsset.paragraph2,
            ),
            if (total == null && progres == null)
              Text(
                subtitle,
                maxLines: maxLines,
                style: titleStyle ?? StyleAsset.paragraph1Bold,
              ),
            if (total != null && progres != null)
              RichText(
                text: TextSpan(
                  text: "$progres / ",
                  style: StyleAsset.paragraph1.copyWith(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "$total",
                      style: StyleAsset.paragraph1Bold
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
                maxLines: maxLines,
              ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          title,
          maxLines: maxLines,
          style: titleStyle ?? StyleAsset.paragraph2,
        ),
        if (total == null && progres == null)
          Text(
            subtitle,
            maxLines: maxLines,
            style: titleStyle ?? StyleAsset.paragraph1Bold,
          ),
        if (total != null && progres != null)
          RichText(
            text: TextSpan(
              text: "$progres / ",
              style: StyleAsset.paragraph1.copyWith(color: Colors.black),
              children: [
                TextSpan(
                  text: "$total",
                  style: StyleAsset.paragraph1Bold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            maxLines: maxLines,
          ),
      ],
    );
  }
}
