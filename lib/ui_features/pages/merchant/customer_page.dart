import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/config/models/area_code.dart';
import 'package:magic_power_sales/config/providers/customer/customer_provider.dart';
import 'package:magic_power_sales/config/repositories/main_repository.dart';
import 'package:magic_power_sales/ui_features/widgets/button/primary_button.dart';
import 'package:magic_power_sales/ui_features/widgets/input/textfield_primary.dart';
import 'package:magic_power_sales/ui_features/widgets/text/text_column.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  bool formIsFilled = false;
  ScrollController scrollController = ScrollController();
  String? areaCodeId, areaName;
  late CustomerProvider provider;

  void initialized() async {
    provider = context.read<CustomerProvider>();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    areaName = prefs.getString("area_name");
    areaCodeId = prefs.getString("area_code");
    if (areaCodeId != null) {
      formIsFilled = true;
      setState(() {});
    }

    if (formIsFilled) {
      provider.initialized(code: areaCodeId);
    }
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        provider.pagginateCustomer();
      }
    });
  }

  @override
  void initState() {
    initialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!formIsFilled) {
      return _DistributorForm(
        onSubmit: (nameArea, area) {
          areaName = nameArea;
          areaCodeId = area;
          formIsFilled = true;
          setState(() {});
        },
      );
    }

    return RefreshIndicator(
      onRefresh: () => provider.getCustomerList(),
      child: ListView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  !isEmpty(areaCodeId) ? (areaCodeId ?? "") : "",
                  style: StyleAsset.heading4SemiBold.copyWith(
                    color: ColorAsset.primary,
                  ),
                ),
                if (!isEmpty(areaCodeId))
                  Text(areaName ?? "", style: StyleAsset.paragraph2),
                Consumer<CustomerProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(
                      "${value.customerList.length} Pelanggan",
                      style: StyleAsset.paragraph3.copyWith(
                        color: ColorAsset.neutral,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Consumer<CustomerProvider>(builder: (context, value, child) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.customerList.length,
              itemBuilder: (context, index) {
                final data = value.customerList[index];
                int level = data.level ?? 1;
                targetLevel(int level) => listTargetLevel
                    .where((e) => e.level == (level == 0 ? 1 : level))
                    .first;
                int totalkarton = ((data.totalCartons ?? 0) +
                    (data.totalCartonsPending ?? 0));
                totalkarton -= (targetLevel(level).totalTarget as int);
                if (totalkarton < 0) totalkarton = 0;
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorAsset.neutral.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextColumn(
                            title: "Nama Pelanggan",
                            subtitle: data.fullName ?? "",
                          ),
                          TextColumn(
                            title: "Nama Toko",
                            subtitle: data.shopName ?? "",
                          ),
                        ],
                      ),
                      verticalSpace(10),
                      TextColumn(
                        useExpanded: false,
                        title: "Level",
                        subtitle: "${data.level ?? "-"}",
                      ),
                      verticalSpace(10),
                      Row(
                        children: [
                          TextColumn.progress(
                            title: "Progress\nLevel",
                            subtitle: "",
                            progres: totalkarton,
                            total: (targetLevel(level == 7 ? 7 : level + 1)
                                .target),
                          ),
                          TextColumn(
                            title: "Progress\nSpray",
                            subtitle: "",
                            progres: data.sprayPcs ?? 0,
                            total: 240,
                          ),
                          TextColumn(
                            title: "Progress\nTissue",
                            subtitle: "",
                            progres: data.tissuePcs ?? 0,
                            total: 420,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

class _DistributorForm extends StatefulWidget {
  const _DistributorForm({required this.onSubmit});
  final Function(String areaName, String codeArea) onSubmit;

  @override
  State<_DistributorForm> createState() => _DistributorFormState();
}

class _DistributorFormState extends State<_DistributorForm> {
  TextEditingController areaCodeController = TextEditingController();
  List<AreaCode> areaCodeList = [];
  void submit() {
    String area = areaCodeController.text;
    if (area.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Silahkan isi salah satu form"),
      ));
      return;
    } else {
      log("Area Code List: ${areaCodeList.length}");
      AreaCode? areaCode;
      final result = areaCodeList
          .where((e) => e.idArea.toLowerCase() == area.toLowerCase());
      if (result.isNotEmpty) areaCode = result.first;
      if (areaCode == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Data tidak ditemukan atau tidak match"),
        ));
        return;
      }
      final provider = context.read<CustomerProvider>();
      widget.onSubmit(areaCode.name, area);
      SharedPreferences.getInstance().then(
        (prefs) {
          prefs.setString("area_code", area);
          prefs.setString("area_name", "${areaCode?.name}");
        },
      );
      provider.initialized(code: area);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MainRepository.getAreaCodes().then((result) {
        if (mounted) {
          areaCodeList = result;
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data Pelanggan",
            style: StyleAsset.heading3Bold.copyWith(color: ColorAsset.primary),
          ),
          const SizedBox(height: 16),
          // TextFieldPrimary(
          //   controller: distributorIdController,
          //   label: "ID Distributor",
          // ),
          TextFieldPrimary(
            controller: areaCodeController,
            label: "Kode Area",
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            label: "Submit",
            onTap: () => submit(),
          ),
        ],
      ),
    );
  }
}
