import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/color_assets.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/helpers/date_compare.dart';
import 'package:magic_power_sales/config/helpers/helpers.dart';
import 'package:magic_power_sales/config/models/distributor.dart';
import 'package:magic_power_sales/config/models/event_campaign.dart';
import 'package:magic_power_sales/config/models/product.dart';
import 'package:magic_power_sales/config/models/transaction.dart';
import 'package:magic_power_sales/config/navigation_services.dart';
import 'package:magic_power_sales/config/repositories/main_repository.dart';
import 'package:magic_power_sales/ui_features/pages/profile/employee_account.dart';
import 'package:magic_power_sales/ui_features/widgets/dialog/success.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> transactions = [], backupTransactions = [];
  List<Product> mainProducts = [];
  List<Distributor> distributors = [];
  List<EventCampaign> listEvents = [];
  bool eventIsAvailable = true;
  EventCampaign? currentEvent;

  TransactionProvider() {
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      await init();
    });
  }

  bool validatedSalesInfo() {
    bool isValid = true;
    final salesInfo = LocalDB.user.user?.salesInformation;
    if (isEmpty(salesInfo?.employeeId) ||
        isEmpty(salesInfo?.branch) ||
        isEmpty(salesInfo?.division) ||
        isEmpty(salesInfo?.position)) {
      isValid = false;
      nextScreen(const EmployeeAccountPage());
    }
    return isValid;
  }

  Future<void> init() async {
    await Future.wait([
      getCampaingPeriod(),
      getTransaction(),
      getProducts(),
      getDistributors(),
    ]);
  }

  Future getCampaingPeriod() async {
    List<EventCampaign> events = await MainRepository.getPeriodeCampaign();
    listEvents = events;
    // Calculate to running countdown event period by date now
    if (events.isNotEmpty) {
      events = events.where((e) => isInDateRange(e.start!, e.end!)).toList();
      eventIsAvailable = events.isNotEmpty;
      if (events.isNotEmpty) currentEvent = events.first;
    }
  }

  Future<void> getTransaction() async {
    transactions.clear();
    backupTransactions.clear();
    notifyListeners();
    var res = await MainRepository.getDraftTransaction();
    transactions = res;
    backupTransactions = res;
    notifyListeners();
  }

  Future<void> searchOrFilter({String? q, String? sortBy}) async {
    transactions = backupTransactions;
    if (q != null && q.isNotEmpty) {
      String query = q.toLowerCase();
      transactions = transactions
          .where((e) =>
              "${e.noInvoice}".toLowerCase().contains(query) ||
              "${e.merchant?.fullName}".toLowerCase().contains(query))
          .toList();
    }
    if (sortBy != null) {
      if (sortBy == "scanned") {
        transactions = transactions
            .where((e) => e.status == StatusTransaction.scanned)
            .toList();
      }
      if (sortBy == "not-scanned") {
        transactions = transactions
            .where((e) => e.status == StatusTransaction.notScanned)
            .toList();
      }
      transactions.sort((a, b) {
        if (sortBy == "asc") {
          return a.createdAt!.compareTo(b.createdAt!);
        } else {
          return b.createdAt!.compareTo(a.createdAt!);
        }
      });
    }
    log("Length -> ${backupTransactions.length}");
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
    if (currentEvent != null) data['event'] = currentEvent!.id;
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
