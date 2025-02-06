import 'package:flutter/material.dart';

enum StatusTransaction { scanned, notScanned }

ValueNotifier<bool> loading = ValueNotifier(false);
