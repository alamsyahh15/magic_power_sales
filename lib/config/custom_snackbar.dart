import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';

void showInSnackBar(String message) {
  BuildContext context = navigatorKey.currentContext!;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  ));
}
