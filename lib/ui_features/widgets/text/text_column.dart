import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';

class TextColumn extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle, subtitleStyle;
  final int? maxLines;
  final bool useExpanded;
  final double? spacing;
  const TextColumn({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.maxLines,
    this.useExpanded = true,
    this.spacing,
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
            Text(
              subtitle,
              maxLines: maxLines,
              style: titleStyle ?? StyleAsset.paragraph1Bold,
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
        Text(
          subtitle,
          maxLines: maxLines,
          style: titleStyle ?? StyleAsset.paragraph1Bold,
        ),
      ],
    );
  }
}
