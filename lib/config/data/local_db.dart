import 'dart:convert';

import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/models/user.dart';
import 'package:magic_power_sales/config/repositories/auth_repository.dart';
import 'package:magic_power_sales/ui_features/pages/auth/login.dart';
import 'package:magic_power_sales/ui_features/pages/main_dashboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static late SharedPreferences _prefs;
  static bool isLoggedIn = false;
  static bool isVerified = false;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    isLoggedIn = user.jwt != null;
    isVerified = user.user?.isVerified == true;
  }

  static Future<void> checkActive() async {
    if (isLoggedIn) {
      var res = await AuthRepository.currentProfile();
      if (res != null) {
        user = res;
        if(user.user?.role?.type == "sales"){
          nextRemoveUntil(const MainDashboardPage());
        }else{
          LocalDB.authGuard(false, isCheckRole: true);
          showInSnackBar("Role anda tidak memiliki akses di aplikasi ini");
        }
      }
    } else {
      logout();
    }
  }

  static set user(User user) {
    final userString = user.toJson();
    isLoggedIn = user.jwt != null;
    isVerified = user.user?.isVerified == true;
    _prefs.setString('user', jsonEncode(userString));
  }

  static User get user {
    final userString = _prefs.getString('user').toString();
    if (!isEmpty(userString)) {
      return User.fromJson(jsonDecode(userString));
    } else {
      return User();
    }
  }

  static Future<void> clearSession() async {
    await _prefs.remove('user');
  }

  static Future<void> logout() async {
    await _prefs.remove('user');
    _prefs.remove('area_code');
    _prefs.remove('area_name');
    isLoggedIn = false;
    user = User();
  }

  static Future<void> authGuard(bool isValid,
      {bool isCheckRole = false}) async {
    if (!isValid) {
      logout();
      if (!isCheckRole) {
        nextRemoveUntil(const LoginPage());
      }
    }
  }
}
