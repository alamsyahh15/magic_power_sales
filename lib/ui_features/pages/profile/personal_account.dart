import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/divider/divider_text.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class PersonalAccountPage extends StatefulWidget {
  const PersonalAccountPage({super.key});

  @override
  State<PersonalAccountPage> createState() => _PersonalAccountPageState();
}

class _PersonalAccountPageState extends State<PersonalAccountPage> {
  TextEditingController nameController = TextEditingController(),
      nikController = TextEditingController(),
      emailController = TextEditingController(),
      phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info Personal"),
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
        child: PrimaryButton(
          label: "Simpan",
          onTap: () {},
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DividerText(
            label: "Informasi Akun",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                TextFieldPrimary(
                  label: "Nama Lengkap",
                  labelStyle: StyleAsset.paragraph2,
                  controller: nameController,
                  hintText: "Masukan nama lengkap",
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
                  label: "NIK (NPWP 16 digit)",
                  labelStyle: StyleAsset.paragraph2,
                  controller: nikController,
                  keyboardType: TextInputType.number,
                  hintText: "Masukan NIK",
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
              ],
            ),
          ),
          const DividerText(
            label: "Kontak",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                TextFieldPrimary(
                  label: "Email",
                  labelStyle: StyleAsset.paragraph2,
                  controller: emailController,
                  hintText: "Masukan email",
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
                  label: "No. Telepon",
                  labelStyle: StyleAsset.paragraph2,
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  hintText: "Masukan nomor telepon",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
