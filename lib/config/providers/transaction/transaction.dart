import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/color_assets.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/models/distributor.dart';
import 'package:magic_power_sales/config/models/product.dart';
import 'package:magic_power_sales/config/models/transaction.dart';
import 'package:magic_power_sales/config/navigation_services.dart';
import 'package:magic_power_sales/config/repositories/main_repository.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/success.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> transactions = [];
  List<Product> mainProducts = [];
  List<Distributor> distributors = [];

  TransactionProvider() {
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      await init();
    });
  }

  Future<void> init() async {
    await Future.wait([
      getTransaction(),
      getProducts(),
      getDistributors(),
    ]);
  }

  Future<void> getTransaction() async {
    transactions.clear();
    notifyListeners();
    var res = await MainRepository.getDraftTransaction();
    transactions = res;
    notifyListeners();
  }

  Future<void> getProducts() async {
    final result = await MainRepository.getProducts();
    mainProducts = result;
    notifyListeners();
  }

  Future<void> getDistributors() async {
    final response = await MainRepository.getDistributor();
    distributors = response;
    if (distributors.isEmpty) {
      distributors.add(Distributor(distributionId: "SA1"));
    }
    notifyListeners();
  }

  Future<void> createDraftTransaction(Map<String, dynamic> data) async {
    final result = await MainRepository.createDraftTransaction(data);
    if (result.code == 200) {
      showInSnackBar("Transaksi berhasil dicatat");
      showModalBottomSheet(
        context: navigatorKey.currentContext!,
        useSafeArea: true,
        backgroundColor: ColorAsset.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        builder: (context) {
          return const SuccessDialog(
            title: "Transaksi berhasil dicatat",
            description: "Silahkan kembali ke aplikasi",
          );
        },
      );
    } else {
      showInSnackBar("Transaksi gagal dicatat");
    }
    await getTransaction();
  }
}
