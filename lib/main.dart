import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:magic_power_sales/app/app.dart';
import 'package:magic_power_sales/config/data/local_db.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting("id_ID");
    await LocalDB.initialize();
    await Firebase.initializeApp();
    runApp(const App());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
