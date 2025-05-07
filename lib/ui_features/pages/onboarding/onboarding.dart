import 'package:flutter/material.dart' hide TextButton;
import 'package:flutter/services.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/providers/setting/setting_provider.dart';
import 'package:magic_power_sales/ui_features/pages/auth/login.dart';
import 'package:magic_power_sales/ui_features/pages/auth/register.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/button/text_button.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SettingProvider>().initialized();
    Future.delayed(const Duration(milliseconds: 500)).whenComplete(
      () => LocalDB.checkActive(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.exampleBanner),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Aplikasi Pembantu untuk Pencatatan Transaksi Penjual",
                    style: StyleAsset.heading3SemiBold,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(10),
                  Text(
                    "PT Etica Sari Pratama",
                    style: StyleAsset.paragraph2.copyWith(
                      color: ColorAsset.neutral70,
                      letterSpacing: -0.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(40),
                  PrimaryButton(
                    label: "Login",
                    onTap: () {
                      nextScreen(const LoginPage());
                    },
                  ),
                  verticalSpace(10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun? ",
                        style: StyleAsset.paragraph2.copyWith(
                          color: ColorAsset.neutral10,
                        ),
                      ),
                      TextButton(
                        label: "Buat akun",
                        onTap: () {
                          nextScreen(const RegisterPage());
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
