import 'package:flutter/material.dart';
import 'package:magic_power_sales/config/models/slide_banner.dart';
import 'package:magic_power_sales/config/repositories/main_repository.dart';

class BannerProvider extends ChangeNotifier {
  BannerProvider() {
    WidgetsBinding.instance.addPostFrameCallback((e) {
      init();
    });
  }

  Future<void> init() async {
    await getBanner();
  }

  List<SlideBanner> banner = [];

  Future<void> getBanner() async {
    var res = await MainRepository.getBanners();
    banner = res;
    notifyListeners();
  }
}
