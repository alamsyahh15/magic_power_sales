import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/repositories/auth_repository.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/image/asset_image.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController controller = TextEditingController();
  bool isLoading = false;

  void reset() async {
    FocusScope.of(context).unfocus();
    if (controller.text.isNotEmpty) {
      setState(() => isLoading = true);
      AuthRepository.sendLinkResetPassword(controller.text).then((response) {
        if (response.code == 200) {
          backScreen();
          showInSnackBar("Link reset password berhasil dikirim ke email anda!");
        }
        setState(() => isLoading = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: const Text("Kembali"),
      ),
      body: Stack(
        children: [
          MPAssetImage(
            height: screenHeight(context),
            '$assetImage/bg_forgot_password.png',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pulihkan Password",
                    style: StyleAsset.heading3Bold,
                  ),
                  Text(
                    "Silahkan masukan email yang terdaftar pada sistem kami untuk memulihkan password Anda.",
                    style: StyleAsset.paragraph3,
                  ),
                  const SizedBox(height: 16),
                  TextFieldPrimary(
                    controller: controller,
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: ColorAsset.secondary),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: "Masukan email",
                  ),
                  SizedBox(height: screenWidth(context) / 3),
                  PrimaryButton(
                    isLoading: isLoading,
                    color: ColorAsset.primary,
                    label: "Reset Password",
                    onTap: reset,
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () => backScreen(),
                    child: Center(
                      child: Text(
                        "Kembali ke Halaman Login",
                        style: StyleAsset.paragraph2SemiBold.copyWith(
                          color: ColorAsset.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
