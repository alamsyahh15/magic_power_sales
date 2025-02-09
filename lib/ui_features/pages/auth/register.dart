import 'package:flutter/material.dart' hide TextButton;
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/repositories/auth_repository.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/button/text_button.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController(),
      emailController = TextEditingController(),
      phoneController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: formKey,
        child: Scaffold(
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
                        validator: (e) {
                          if (isEmpty(e)) {
                            return "Kolom masih kosong";
                          }
                          return null;
                        },
                        controller: usernameController,
                        label: "Username",
                        hintText: "Masukkan username",
                      ),
                      TextFieldPrimary(
                        validator: (e) {
                          if (isEmpty(e)) {
                            return "Kolom masih kosong";
                          }
                          return null;
                        },
                        controller: emailController,
                        label: "Email",
                        hintText: "Masukkan email",
                      ),
                      TextFieldPrimary(
                        validator: (e) {
                          if (isEmpty(e)) {
                            return "Kolom masih kosong";
                          }
                          return null;
                        },
                        controller: phoneController,
                        label: "No. Telepon",
                        hintText: "Masukkan nomor telepon",
                      ),
                      TextFieldPrimary(
                        validator: (e) {
                          if (isEmpty(e)) {
                            return "Kolom masih kosong";
                          }
                          return null;
                        },
                        controller: passwordController,
                        label: "Password",
                        hintText: "Masukkan password",
                        isPassword: true,
                      ),
                      TextFieldPrimary(
                        validator: (e) {
                          if (isEmpty(e)) {
                            return "Kolom masih kosong";
                          }
                          if (confirmPasswordController.text !=
                              passwordController.text) {
                            return "Konfirmasi password tidak sama";
                          }
                          return null;
                        },
                        controller: confirmPasswordController,
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
                    ValueListenableBuilder(
                      valueListenable: loading,
                      builder: (context, value, _) {
                        return PrimaryButton(
                          isLoading: loading.value,
                          label: "Buat Akun",
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              Map<String, dynamic> request = {
                                "username": usernameController.text,
                                "email": emailController.text,
                                "phone_number": phoneController.text,
                                "password": passwordController.text,
                              };
                              var res = await AuthRepository.register(request);
                              if (res.code == 200) {
                                backScreen();
                                showInSnackBar(
                                  "Registrasi berhasil, akun anda akan segera diaktifkan",
                                );
                              }
                            }
                          },
                        );
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
        ),
      ),
    );
  }
}
