import 'package:flutter/material.dart' hide TextButton;
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/repositories/auth_repository.dart';
import 'package:magic_power_sales/ui_features/pages/auth/forgot_password.dart';
import 'package:magic_power_sales/ui_features/pages/auth/register.dart';
import 'package:magic_power_sales/ui_features/pages/main_dashboard_page.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/button/text_button.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameControler = TextEditingController(),
      passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: formKey,
        child: Scaffold(
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
                        controller: usernameControler,
                        validator: (e) {
                          if (e != null && e.isEmpty) {
                            return "Kolom username/email tidak boleh kosong";
                          }
                          return null;
                        },
                        label: "Username/Email",
                        hintText: "Masukkan username atau email",
                      ),
                      TextFieldPrimary(
                        expands: null,
                        label: "Password",
                        isPassword: true,
                        controller: passwordController,
                        hintText: "Masukkan password",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  activeColor: ColorAsset.blue,
                                  value: rememberMe,
                                  onChanged: (e) {
                                    setState(() {
                                      rememberMe = !rememberMe;
                                    });
                                  },
                                ),
                                Text(
                                  "Ingat saya",
                                  style: StyleAsset.paragraph2,
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onTap: () => nextScreen(const ForgotPassword()),
                            label: "Lupa Password",
                            textDecoration: TextDecoration.underline,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder(
                        valueListenable: loading,
                        builder: (context, value, _) {
                          return PrimaryButton(
                            label: "Login",
                            isLoading: loading.value,
                            onTap: () async {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                Map<String, dynamic> request = {
                                  "identifier": usernameControler.text,
                                  "password": passwordController.text,
                                };
                                var res = await AuthRepository.login(request);
                                if (res.code == 200) {
                                  AuthRepository.currentProfile().then((user) {
                                    if (user != null) LocalDB.user = user;
                                    nextRemoveUntil(const MainDashboardPage());
                                  });
                                }
                              }
                            },
                          );
                        }),
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
                    verticalSpace(20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
