import 'package:flutter/material.dart';
import 'package:magic_power_sales/app/app.dart';
import 'package:magic_power_sales/config/data/local_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDB.initialize();
  runApp(const App());
}
