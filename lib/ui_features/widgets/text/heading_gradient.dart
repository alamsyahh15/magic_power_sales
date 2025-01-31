import 'package:flutter/material.dart';

import '../../../config/config.dart';

class HeadingGradient extends StatelessWidget {
  const HeadingGradient({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return ColorAsset.textgradientColor.createShader(bounds);
      },
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: StyleAsset.paragraph1Bold.copyWith(
          fontSize: screenHeight(context) / 26,
        ),
      ),
    );
  }
}
