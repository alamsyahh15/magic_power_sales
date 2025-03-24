import 'package:flutter/material.dart';

enum StatusTransaction { scanned, notScanned }

ValueNotifier<bool> loading = ValueNotifier(false);

List listTargetLevel = [
  (level: 1, target: 3, totalTarget: 3),
  (level: 2, target: 5, totalTarget: 8),
  (level: 3, target: 8, totalTarget: 16),
  (level: 4, target: 18, totalTarget: 34),
  (level: 5, target: 38, totalTarget: 72),
  (level: 6, target: 68, totalTarget: 140),
  (level: 7, target: 88, totalTarget: 228),
];
