import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/color_assets.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/navigation_services.dart';
import 'package:magic_power_sales/config/repositories/auth_repository.dart';
import 'package:magic_power_sales/config/style_assets.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class DeleteAccountModal {
  static Future show(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const DeleteAccountModalView();
      },
    );
  }
}

class DeleteAccountModalView extends StatefulWidget {
  const DeleteAccountModalView({super.key});

  @override
  State<DeleteAccountModalView> createState() => _DeleteAccountModalViewState();
}

class _DeleteAccountModalViewState extends State<DeleteAccountModalView> {
  String validationDelete = "";
  bool isLoading = false;

  void deleteAccount() async {
    FocusScope.of(context).unfocus();
    final user = LocalDB.user.user;
    setState(() => isLoading = true);
    await AuthRepository.editProfile({
      "username": "${user?.username}",
      "email": "deleted-${user?.email}",
      "phone": "${user?.phoneNumber}",
      "address": "${user?.address}",
      "fullname": "${user?.fullName}",
      "shop_name": user?.shopName ?? "-",
    });
    setState(() => isLoading = false);
    backScreen();
    LocalDB.logout();
  }

  @override
  Widget build(BuildContext context) {
    bool isValid = validationDelete == "DELETE";
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Delete Account",
                      style: StyleAsset.paragraph1Bold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: GestureDetector(
                      onTap: backScreen,
                      child: const Icon(Icons.clear, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            const Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: StyleAsset.paragraph1Bold.copyWith(
                        color: Colors.black,
                      ),
                      text:
                          "Semua data dalam akun kamu akan kami hapus. Silahkan ketikan perintah",
                      children: [
                        TextSpan(
                          text: " DELETE ",
                          style: StyleAsset.paragraph1Bold.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "untuk kami proses penghapusan akun kamu.",
                          style: StyleAsset.paragraph1Bold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFieldPrimary(
                    hintText: "DELETE",
                    inputBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: validationDelete == "DELETE"
                            ? Colors.red
                            : ColorAsset.secondary,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    onChanged: (value) {
                      if (value != null) validationDelete = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.all(24),
                child: PrimaryButton(
                  height: 48,
                  isLoading: isLoading,
                  width: MediaQuery.of(context).size.width,
                  color: isValid ? Colors.red : Colors.grey,
                  onTap: () {
                    if (isValid) deleteAccount();
                  },
                  label: "Delete Account",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
