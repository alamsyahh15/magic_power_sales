import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/models/customer.dart';
import 'package:magic_power_sales/config/repositories/main_repository.dart';

class CustomerProvider extends ChangeNotifier {
  final _customerList = <Customer>[];
  List<Customer> get customerList => _customerList;
  int currenPage = 1;
  bool loadMore = false;

  Future<void> getCustomerList(
      {String? distributorId, String? areaCode}) async {
    currenPage = 1;
    _customerList.clear();
    _customerList.addAll(await MainRepository.getCustomers(
        areaCode: areaCode, distributorId: distributorId));
    notifyListeners();
  }

  Future<void> pagginateCustomer() async {
    loadMore = true;
    notifyListeners();
    _customerList.addAll(await MainRepository.getCustomers(
      page: currenPage + 1,
    ));
    currenPage++;
    loadMore = false;
    notifyListeners();
  }
}
