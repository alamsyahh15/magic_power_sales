import 'package:flutter/material.dart';
import 'package:magic_power_sales/ui_features/widgets/divider/divider_text.dart';

class PersonalAccountPage extends StatelessWidget {
  const PersonalAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info Personal"),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          DividerText(
            label: "Informasi Akun",
          ),
        ],
      ),
    );
  }
}
