import 'package:flutter/material.dart';

class ColorAsset {
  static Color black = const Color.fromARGB(255, 0, 0, 0);
  static Color white = const Color.fromRGBO(255, 255, 255, 1);

  static Color neutral90 = const Color.fromRGBO(13, 15, 19, 1);
  static Color neutral80 = const Color.fromRGBO(27, 31, 38, 1);
  static Color neutral70 = const Color.fromRGBO(40, 46, 57, 1);
  static Color neutral60 = const Color.fromRGBO(53, 62, 76, 1);
  static Color neutral50 = const Color.fromRGBO(67, 78, 95, 1);
  static Color neutral40 = const Color.fromRGBO(80, 93, 113, 1);
  static Color neutral30 = const Color.fromRGBO(93, 109, 132, 1);
  static Color neutral20 = const Color.fromRGBO(108, 126, 153, 1);
  static Color neutral10 = const Color.fromRGBO(120, 140, 170, 1);
  static Color neutral = const Color.fromRGBO(133, 155, 189, 1);
  static Color neutralNegative10 = const Color.fromRGBO(145, 165, 196, 1);
  static Color neutralNegative20 = const Color.fromRGBO(157, 175, 202, 1);
  static Color neutralNegative30 = const Color.fromRGBO(170, 185, 209, 1);
  static Color neutralNegative40 = const Color.fromRGBO(182, 195, 215, 1);
  static Color neutralNegative50 = const Color.fromRGBO(194, 205, 222, 1);
  static Color neutralNegative60 = const Color.fromRGBO(206, 215, 229, 1);
  static Color neutralNegative70 = const Color.fromRGBO(218, 225, 235, 1);
  static Color neutralNegative80 = const Color.fromRGBO(231, 235, 242, 1);
  static Color neutralNegative90 = const Color.fromRGBO(243, 245, 248, 1);

  static Color primary90 = const Color.fromRGBO(21, 3, 5, 1);
  static Color primary80 = const Color.fromRGBO(43, 7, 10, 1);
  static Color primary70 = const Color.fromRGBO(64, 10, 15, 1);
  static Color primary60 = const Color.fromRGBO(86, 14, 20, 1);
  static Color primary50 = const Color.fromRGBO(108, 18, 25, 1);
  static Color primary40 = const Color.fromRGBO(129, 21, 29, 1);
  static Color primary30 = const Color.fromRGBO(151, 25, 34, 1);
  static Color primary20 = const Color.fromRGBO(172, 28, 39, 1);
  static Color primary10 = const Color.fromRGBO(194, 32, 44, 1);
  static Color primary = const Color.fromRGBO(215, 35, 49, 1);
  static Color primaryNegative10 = const Color.fromRGBO(219, 57, 70, 1);
  static Color primaryNegative20 = const Color.fromRGBO(223, 79, 90, 1);
  static Color primaryNegative30 = const Color.fromRGBO(227, 101, 111, 1);
  static Color primaryNegative40 = const Color.fromRGBO(231, 123, 131, 1);
  static Color primaryNegative50 = const Color.fromRGBO(235, 145, 152, 1);
  static Color primaryNegative60 = const Color.fromRGBO(239, 167, 173, 1);
  static Color primaryNegative70 = const Color.fromRGBO(243, 189, 193, 1);
  static Color primaryNegative80 = const Color.fromRGBO(247, 211, 214, 1);
  static Color primaryNegative90 = const Color.fromRGBO(251, 233, 234, 1);

  static Color success40 = const Color.fromRGBO(31, 122, 61, 1);
  static Color success30 = const Color.fromRGBO(41, 163, 82, 1);
  static Color success20 = const Color.fromRGBO(51, 204, 102, 1);
  static Color success = const Color.fromRGBO(235, 250, 240, 1);

  static Color error40 = const Color.fromRGBO(129, 21, 29, 1);
  static Color error30 = const Color.fromRGBO(215, 35, 49, 1);
  static Color error20 = const Color.fromRGBO(223, 79, 90, 1);
  static Color error10 = const Color.fromRGBO(231, 123, 131, 1);
  static Color error = const Color.fromRGBO(251, 233, 234, 1);

  static Color warning40 = const Color.fromRGBO(153, 104, 31, 1);
  static Color warning30 = const Color.fromRGBO(255, 153, 0, 1);
  static Color warning20 = const Color.fromRGBO(255, 173, 51, 1);
  static Color warning10 = const Color.fromRGBO(255, 206, 133, 1);
  static Color warning = const Color.fromRGBO(255, 239, 214, 1);

  static Color accent40 = const Color.fromRGBO(49, 1, 81, 1);
  static Color accent30 = const Color.fromRGBO(180, 64, 255, 1);
  static Color accent20 = const Color.fromRGBO(204, 127, 255, 1);
  static Color accent10 = const Color.fromRGBO(229, 191, 255, 1);
  static Color accent = const Color.fromRGBO(245, 230, 255, 1);

  static Color grey = const Color.fromRGBO(133, 155, 189, 1);
  static Color grey10 = const Color.fromRGBO(243, 245, 248, 1);
  static Color grey20 = const Color.fromRGBO(218, 225, 235, 1);
  static Color grey30 = const Color.fromRGBO(194, 205, 222, 1);
  static Color grey40 = const Color.fromRGBO(170, 185, 209, 1);

  static LinearGradient gradientColor = LinearGradient(
    begin: Alignment.bottomLeft,
    colors: [primaryNegative10, primary, primaryNegative10],
  );

  static LinearGradient textgradientColor = LinearGradient(
    begin: Alignment.bottomLeft,
    colors: [primaryNegative10, primary, primaryNegative10],
  );
}
