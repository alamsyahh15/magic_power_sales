import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// FontWeight light = FontWeight.w300;
// FontWeight regular = FontWeight.w400;
// FontWeight medium = FontWeight.w500;
// FontWeight semibold = FontWeight.w600;
// FontWeight bold = FontWeight.w700;
// FontWeight extrabold = FontWeight.w800;
// FontWeight veryextrabold = FontWeight.w900;

// const marginPage = 24.0;
// const double smallMargin = 6;
// const double mediumMargin = 12;
// const double largeMargin = 24;
// const double largestMargin = 48;

Widget horizontalSpace(double size) => SizedBox(width: size);

// Vertical Spacing
Widget verticalSpace(double size) => SizedBox(height: size);

// Screen Size helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenPadTop(BuildContext context) => MediaQuery.of(context).padding.top;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * (percentage / 100);

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * (percentage / 100);

void setNormalOritentaion() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

void setLandscapeOritentaion() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
