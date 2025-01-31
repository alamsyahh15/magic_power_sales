import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/color_assets.dart';
import 'package:magic_power_sales/config/navigation_services.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Inter",
        scaffoldBackgroundColor: ColorAsset.white,
        appBarTheme: AppBarTheme(
          color: ColorAsset.white,
        ),
      ),
      navigatorKey: navigatorKey,
    );
  }
}
