import 'package:flutter/material.dart';

enum StatusTransaction { scanned, notScanned }

ValueNotifier<bool> loading = ValueNotifier(false);

List listTargetLevel = [
  (level: 1, target: 3, totalTarget: 3),
  (level: 2, target: 2, totalTarget: 5),
  (level: 3, target: 3, totalTarget: 8),
  (level: 4, target: 4, totalTarget: 12),
  (level: 5, target: 6, totalTarget: 18),
];
