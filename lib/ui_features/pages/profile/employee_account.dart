import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
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
                  onTap: () {},
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
                  onTap: () {},
                  label: "Cabang",
                  labelStyle: StyleAsset.paragraph2,
                  controller: branchController,
                  keyboardType: TextInputType.number,
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
                  onTap: () {},
                  label: "Divisi",
                  labelStyle: StyleAsset.paragraph2,
                  controller: divisionController,
                  keyboardType: TextInputType.number,
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
                  onTap: () {},
                  label: "Jabatan",
                  labelStyle: StyleAsset.paragraph2,
                  controller: positionController,
                  keyboardType: TextInputType.number,
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
                  onTap: () {},
                  label: "Grade",
                  labelStyle: StyleAsset.paragraph2,
                  controller: gradeController,
                  keyboardType: TextInputType.number,
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
                  onTap: () {},
                  label: "Status Kepegawaian",
                  labelStyle: StyleAsset.paragraph2,
                  controller: statusEmployeeController,
                  keyboardType: TextInputType.number,
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
                  onTap: () {},
                  label: "Manager",
                  labelStyle: StyleAsset.paragraph2,
                  controller: managerController,
                  keyboardType: TextInputType.number,
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
        ],
      ),
    );
  }
}
