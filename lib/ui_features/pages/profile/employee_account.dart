import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/models/user.dart';
import 'package:magic_power_sales/config/repositories/auth_repository.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/divider/divider_text.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';

class EmployeeAccountPage extends StatefulWidget {
  const EmployeeAccountPage({super.key});

  @override
  State<EmployeeAccountPage> createState() => _EmployeeAccountPageState();
}

class _EmployeeAccountPageState extends State<EmployeeAccountPage> {
  TextEditingController idController = TextEditingController(),
      branchController = TextEditingController(),
      divisionController = TextEditingController(),
      phoneController = TextEditingController(),
      positionController = TextEditingController(),
      gradeController = TextEditingController(),
      statusEmployeeController = TextEditingController(),
      managerController = TextEditingController();

  bool isLoading = false;

  bool isValid() {
    if (idController.text.isEmpty) {
      showInSnackBar("ID Pegawai tidak boleh kosong");
      return false;
    }

    if (branchController.text.isEmpty) {
      showInSnackBar("Cabang tidak boleh kosong");
      return false;
    }

    if (divisionController.text.isEmpty) {
      showInSnackBar("Divisi tidak boleh kosong");
      return false;
    }

    if (positionController.text.isEmpty) {
      showInSnackBar("Jabatan tidak boleh kosong");
      return false;
    }

    if (gradeController.text.isEmpty) {
      showInSnackBar("Grade tidak boleh kosong");
      return false;
    }

    if (statusEmployeeController.text.isEmpty) {
      showInSnackBar("Status Kepegawaian tidak boleh kosong");
      return false;
    }

    if (managerController.text.isEmpty) {
      showInSnackBar("Manager tidak boleh kosong");
      return false;
    }

    return true;
  }

  void updateEmployee() async {
    setState(() => isLoading = true);
    if (isValid()) {
      Map<String, dynamic>? request = {};
      if (LocalDB.user.user != null) {
        UserData user = LocalDB.user.user!;
        user.salesInformation?.employeeId = idController.text;
        user.salesInformation?.branch = branchController.text;
        user.salesInformation?.division = divisionController.text;
        user.salesInformation?.position = positionController.text;
        user.salesInformation?.grade = gradeController.text;
        user.salesInformation?.statusEmployee = statusEmployeeController.text;
        user.salesInformation?.manager = managerController.text;
        request = user.requestEmployee();
      }
      var res = await AuthRepository.editProfile(request);
      if (res.code == 200) {
        await AuthRepository.currentProfile().then((user) {
          if (user != null) LocalDB.user = user;
        });
        backScreen();
        showInSnackBar("Ubah data berhasil");
      }
    }
    setState(() => isLoading = false);
  }

  void initialized() {
    SalesInformation? salesInformation = LocalDB.user.user?.salesInformation;
    idController.text = salesInformation?.employeeId ?? "";
    branchController.text = salesInformation?.branch ?? "";
    divisionController.text = salesInformation?.division ?? "";
    positionController.text = salesInformation?.position ?? "";
    gradeController.text = salesInformation?.grade ?? "";
    statusEmployeeController.text = salesInformation?.statusEmployee ?? "";
    managerController.text = salesInformation?.manager ?? "";
  }

  @override
  void initState() {
    initialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info Pegawai"),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DividerText(
            label: "Informasi Pegawai",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                TextFieldPrimary(
                  label: "ID Pegawai",
                  labelStyle: StyleAsset.paragraph2,
                  controller: idController,
                  hintText: "Masukan ID pegawai",
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
                  label: "Cabang",
                  labelStyle: StyleAsset.paragraph2,
                  controller: branchController,
                  hintText: "Masukan cabang",
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
                  label: "Divisi",
                  labelStyle: StyleAsset.paragraph2,
                  controller: divisionController,
                  hintText: "Masukan divisi",
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
                  label: "Jabatan",
                  labelStyle: StyleAsset.paragraph2,
                  controller: positionController,
                  hintText: "Masukan jabatan",
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
                  label: "Grade",
                  labelStyle: StyleAsset.paragraph2,
                  controller: gradeController,
                  hintText: "Masukan grade",
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
                  label: "Status Kepegawaian",
                  labelStyle: StyleAsset.paragraph2,
                  controller: statusEmployeeController,
                  hintText: "Masukan status kepegawaian",
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
                  label: "Manager",
                  labelStyle: StyleAsset.paragraph2,
                  controller: managerController,
                  hintText: "Masukan manager",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: PrimaryButton(
              isLoading: isLoading,
              label: "Simpan",
              onTap: updateEmployee,
            ),
          )
        ],
      ),
    );
  }
}
