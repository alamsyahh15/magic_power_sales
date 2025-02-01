import 'package:flutter/material.dart' hide TextButton;
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/button/text_button.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    "Buat Akun",
                    style: StyleAsset.heading2Bold.copyWith(
                      color: ColorAsset.primary,
                    ),
                  ),
                  verticalSpace(15),
                  TextFieldPrimary(
                    controller: usernameController,
                    label: "Username",
                    hintText: "Masukkan username",
                  ),
                  TextFieldPrimary(
                    controller: usernameController,
                    label: "Email",
                    hintText: "Masukkan email",
                  ),
                  TextFieldPrimary(
                    controller: usernameController,
                    label: "No. Telepon",
                    hintText: "Masukkan nomor telepon",
                  ),
                  TextFieldPrimary(
                    controller: usernameController,
                    label: "Password",
                    hintText: "Masukkan password",
                    isPassword: true,
                  ),
                  TextFieldPrimary(
                    controller: usernameController,
                    label: "Ulangi password",
                    hintText: "Masukkan ulang password",
                    isPassword: true,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryButton(
                  label: "Buat Akun",
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
                verticalSpace(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah punya akun? ",
                      style: StyleAsset.paragraph2.copyWith(
                        color: ColorAsset.neutral10,
                      ),
                    ),
                    TextButton(
                      label: "Login",
                      onTap: () {
                        backScreen();
                      },
                    )
                  ],
                ),
                verticalSpace(20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
