import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/models/transaction.dart';
import 'package:magic_power_sales/config/repositories/main_repository.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> transactions = [];

  TransactionProvider() {
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      await init();
    });
  }

  Future<void> init() async {
    await getTransaction();
  }

  Future<void> getTransaction() async {
    var res = await MainRepository.getDraftTransaction();

    transactions = res;

    notifyListeners();
  }
}
