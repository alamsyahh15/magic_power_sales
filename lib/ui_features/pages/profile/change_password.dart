import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/repositories/auth_repository.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController passwordController = TextEditingController(),
      newPasswordController = TextEditingController(),
      confirmationController = TextEditingController();

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
          appBar: AppBar(
            title: const Text("Ubah Password"),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: ColorAsset.borderSecondary,
                ),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: ValueListenableBuilder(
              valueListenable: loading,
              builder: (context, value, _) {
                return PrimaryButton(
                  isLoading: loading.value,
                  label: "Simpan",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      Map<String, dynamic> request = {
                        "currentPassword": passwordController.text,
                        "password": newPasswordController.text,
                        "passwordConfirmation": confirmationController.text,
                      };

                      var res = await AuthRepository.changePassword(request);

                      if (res.code == 200) {
                        setState(() {
                          passwordController.clear();
                          newPasswordController.clear();
                          confirmationController.clear();
                        });
                        showInSnackBar("Password telah diubah");
                      }
                    }
                  },
                );
              },
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextFieldPrimary(
                label: "Password Sekarang",
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                labelStyle: StyleAsset.paragraph2,
                isPassword: true,
                controller: passwordController,
                hintText: "Masukan password sekarang",
                gapLabel: 2,
                fontSize: 20,
                inputBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorAsset.neutralNegative80,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintStyle: StyleAsset.heading4SemiBold,
              ),
              verticalSpace(10),
              TextFieldPrimary(
                label: "Password Baru",
                labelStyle: StyleAsset.paragraph2,
                isPassword: true,
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                controller: newPasswordController,
                hintText: "Masukan password baru",
                gapLabel: 2,
                fontSize: 20,
                inputBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorAsset.neutralNegative80,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintStyle: StyleAsset.heading4SemiBold,
              ),
              verticalSpace(10),
              TextFieldPrimary(
                validator: (e) {
                  if (e != newPasswordController.text) {
                    return "Password tidak sama";
                  }

                  return null;
                },
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                label: "Konfirmasi Password",
                labelStyle: StyleAsset.paragraph2,
                isPassword: true,
                controller: confirmationController,
                hintText: "Masukan konfirmasi password",
                gapLabel: 2,
                fontSize: 20,
                inputBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorAsset.neutralNegative80,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                hintStyle: StyleAsset.heading4SemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
