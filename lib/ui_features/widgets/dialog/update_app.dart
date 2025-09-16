import 'dart:io';

import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/navigation_services.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateAppDialog {
  static Future<void> show() async {
    final context = navigatorKey.currentContext!;
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Update Available'),
        content: const Text(
            'Versi baru tersedia. Silakan perbarui untuk melanjutkan menggunakan aplikasi.'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              if (Platform.isAndroid) {
                launchUrl(Uri.parse(
                    'https://play.google.com/store/apps/details?id=co.magicpower.sales'));
              } else if (Platform.isIOS) {
                launchUrl(Uri.parse('https://apps.apple.com/app/id6743303438'));
              }
            },
            child: const Text('Update'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
