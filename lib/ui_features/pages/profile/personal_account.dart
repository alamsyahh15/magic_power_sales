import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/repositories/auth_repository.dart';
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
      usernameController = TextEditingController(),
      emailController = TextEditingController(),
      phoneController = TextEditingController(),
      addressController = TextEditingController(),
      shopNmeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading.value = false;
    usernameController.text = LocalDB.user.user?.username ?? "";
    if (usernameController.text.contains(
        "${LocalDB.user.user?.fullName?.replaceAll(" ", "").toLowerCase()}")) {
      usernameController.text = "";
    }
    nameController.text = LocalDB.user.user?.fullName ?? "";
    emailController.text = LocalDB.user.user?.email ?? "";
    phoneController.text = LocalDB.user.user?.phoneNumber ?? "";
    addressController.text = LocalDB.user.user?.address ?? "";
    shopNmeController.text = LocalDB.user.user?.shopName ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
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
          child: ValueListenableBuilder(
              valueListenable: loading,
              builder: (context, value, _) {
                return PrimaryButton(
                  isLoading: loading.value,
                  label: "Simpan",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      Map<String, dynamic> request = {
                        "username": usernameController.text,
                        "email": emailController.text,
                        "phone_number": phoneController.text,
                        "full_name": nameController.text,
                        "address": addressController.text,
                        "shop_name": shopNmeController.text,
                      };
                      var res = await AuthRepository.editProfile(request);
                      if (res.code == 200) {
                        await AuthRepository.currentProfile().then((user) {
                          if (user != null) LocalDB.user = user;
                        });
                        showInSnackBar("Ubah data berhasil");
                      }
                    }
                  },
                );
              }),
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
                  // verticalSpace(10),
                  // TextFieldPrimary(
                  //   label: "Username",
                  //   labelStyle: StyleAsset.paragraph2,
                  //   controller: usernameController,
                  //   keyboardType: TextInputType.number,
                  //   hintText: "Masukan Username",
                  //   gapLabel: 2,
                  //   fontSize: 20,
                  //   inputBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(
                  //       color: ColorAsset.neutralNegative80,
                  //     ),
                  //   ),
                  //   contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  //   hintStyle: StyleAsset.heading4SemiBold,
                  // ),
                  verticalSpace(10),
                  TextFieldPrimary(
                    label: "NIK (NPWP 16 digit)",
                    labelStyle: StyleAsset.paragraph2,
                    controller: usernameController,
                    keyboardType: TextInputType.number,
                    hintText: "Masukan NIK/NPWP",
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
                  // TextFieldPrimary(
                  //   label: "Alamat",
                  //   labelStyle: StyleAsset.paragraph2,
                  //   controller: addressController,
                  //   hintText: "Masukan alamat anda",
                  //   gapLabel: 2,
                  //   fontSize: 20,
                  //   inputBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(
                  //       color: ColorAsset.neutralNegative80,
                  //     ),
                  //   ),
                  //   contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  //   hintStyle: StyleAsset.heading4SemiBold,
                  // ),
                  // verticalSpace(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
