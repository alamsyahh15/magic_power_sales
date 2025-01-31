import 'package:flutter/material.dart' hide TextButton;
import 'package:magic_power_sales/ui_features/widgets/button/text_button.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextFieldPrimary(
                    label: "Username/Email",
                    hintText: "Masukkan username atau email",
                  ),
                  TextFieldPrimary(
                    expands: null,
                    label: "Password",
                    hintText: "Masukkan password",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onTap: () {},
                        label: "Lupa Password",
                        textDecoration: TextDecoration.underline,
                      ),
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
