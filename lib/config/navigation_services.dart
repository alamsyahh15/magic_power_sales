import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<T?> nextScreen<T extends Object?>(Widget screen,
    [BuildContext? context]) async {
  return await Navigator.of(context ?? navigatorKey.currentContext!)
      .push<T>(CupertinoPageRoute(builder: (context) => screen));
}

Future<void> nextReplace(Widget screen, [BuildContext? context]) async {
  await Navigator.of(context ?? navigatorKey.currentContext!)
      .pushReplacement(CupertinoPageRoute(builder: (context) => screen));
}

Future<void> nextRemoveUntil(Widget screen, [BuildContext? context]) async {
  await Navigator.of(context ?? navigatorKey.currentContext!)
      .pushAndRemoveUntil(
    CupertinoPageRoute(builder: (_) => screen),
    (route) => false,
  );
  // await navigatorKey.currentState!.pushAndRemoveUntil(
  //   PageRouteBuilder(
  //     pageBuilder: (_, __, ___) => screen,
  //     transitionDuration: const Duration(seconds: 1),
  //     transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
  //   ),
  //   (route) => route.isFirst,
  // );
}

void backScreen([dynamic result, BuildContext? context]) {
  Navigator.pop(context ?? navigatorKey.currentState!.context, result);
}

void goBackUntil() {
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}

Future<T?> showBottomSheet<T>(
  BuildContext context,
  Widget widget, {
  bool isScrollControlled = true,
  bool enableDrag = true,
  Color? backgroundColor,
  bool isDismissible = true,
}) async {
  return await showModalBottomSheet<T>(
      context: context,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      backgroundColor: backgroundColor ?? Colors.white,
      isScrollControlled: isScrollControlled,
      shape: backgroundColor != null
          ? null
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
      builder: (BuildContext context) {
        return widget;
      });
}

Future<T?> showAlertDialog<T>(
  BuildContext context,
  Widget widget,
) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return widget;
    },
  );
}
