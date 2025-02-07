import 'package:flutter/material.dart';
// import 'package:flutter';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/providers/banner/banner.dart';
import 'package:magic_power_sales/ui_features/pages/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BannerProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Inter",
          scaffoldBackgroundColor: ColorAsset.white,
          checkboxTheme: CheckboxThemeData(
            checkColor: WidgetStatePropertyAll<Color>(ColorAsset.error),
          ),
          appBarTheme: AppBarTheme(
            color: ColorAsset.white,
            centerTitle: true,
            titleTextStyle: StyleAsset.heading4Bold.copyWith(
              color: ColorAsset.primary,
            ),
          ),
        ),
        navigatorKey: navigatorKey,
        home: const OnBoardingPage(),
      ),
    );
  }
}
