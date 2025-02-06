import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/helpers/api_base_helper.dart';
import 'package:magic_power_sales/config/helpers/log_helper.dart';
import 'package:magic_power_sales/config/models/response_data.dart';
import 'package:magic_power_sales/config/models/user.dart';
import 'package:mime/mime.dart';

class AuthRepository {
  static final ApiBaseHelper _helper = ApiBaseHelper();

  static Future<ResponseData> register(Map<String, dynamic> data) async {
    const String endpoint = '/auth/register?role=sales';
    final Map<String, dynamic> params = data;
    ResponseData? responseData;

    try {
      responseData = await _helper.post(url: endpoint, data: params);
      if (responseData.code == 200) {
        LocalDB.user = User.fromJson(responseData.data);
      }
      return responseData;
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.post,
        responseData: responseData,
        params: params,
      );
    }
  }

  static Future<ResponseData> login(Map<String, dynamic> data) async {
    const String endpoint = '/auth/login';
    final Map<String, dynamic> params = data;
    ResponseData? responseData;

    try {
      responseData = await _helper.post(url: endpoint, data: params);
      if (responseData.code == 200) {
        LocalDB.user = User.fromJson(responseData.data);
      }
      return responseData;
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.post,
        responseData: responseData,
        params: params,
      );
    }
  }

  static Future<User?> currentProfile(
      [Map<String, dynamic> data = const {}]) async {
    const String endpoint = '/auth/me';
    final Map<String, dynamic> params = data;
    ResponseData? responseData;
    User? user;
    try {
      responseData = await _helper.get(url: endpoint, data: params);
      if (responseData.code == 200) {
        user = User(
          jwt: LocalDB.user.jwt,
          user: UserData.fromJson(responseData.data),
        );
      }
      return user;
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.get,
        responseData: responseData,
        params: params,
      );
    }
  }

  static Future<ResponseData> avatarUpload(File image) async {
    const String endpoint = 'auth/upload-profile';

    String fileName = image.path.split('/').last;
    String? mimeType = lookupMimeType(image.path);
    final params = {
      "image": await MultipartFile.fromFile(
        image.path,
        filename: fileName,
        contentType: MediaType.parse("$mimeType"),
      )
    };
    FormData data = FormData.fromMap(params);
    ResponseData? responseData;

    try {
      responseData = await _helper.post(
        url: endpoint,
        data: data,
        contentType: 'multipart/form-data',
      );
      if (responseData.code == 200) {
        LocalDB.user.user = UserData.fromJson(responseData.data);
      }
      return responseData;
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.post,
        responseData: responseData,
        params: params,
      );
    }
  }

  static Future<ResponseData> editProfile(Map<String, dynamic> data) async {
    const String endpoint = '/auth/profile-edit';
    final Map<String, dynamic> params = data;
    ResponseData? responseData;
    try {
      responseData = await _helper.put(url: endpoint, data: params);
      if (responseData.code == 200) {
        LocalDB.user.user = UserData.fromJson(responseData.data);
      }
      return responseData;
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.put,
        responseData: responseData,
        params: params,
      );
    }
  }

  static Future<ResponseData> changePassword(Map<String, dynamic> data) async {
    const String endpoint = '/auth/me/change-password';
    final Map<String, dynamic> params = data;
    ResponseData? responseData;
    try {
      responseData = await _helper.post(url: endpoint, data: params);
      if (responseData.code == 200) {
        LocalDB.user = User.fromJson(responseData.data);
      }
      return responseData;
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.put,
        responseData: responseData,
        params: params,
      );
    }
  }

  static Future<ResponseData> sendLinkResetPassword(String email) async {
    const String endpoint = '/auth/send-email';
    final Map<String, dynamic> params = {
      "email": email,
      "type": "reset-password",
    };
    ResponseData? responseData;
    try {
      responseData = await _helper.post(url: endpoint, data: params);
      return responseData;
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.post,
        responseData: responseData,
        params: params,
      );
    }
  }

  static Future<ResponseData> resetPassword(Map<String, dynamic> param) async {
    const String endpoint = '/auth/reset-password';
    final Map<String, dynamic> params = param;
    ResponseData? responseData;
    try {
      responseData = await _helper.post(url: endpoint, data: params);
      return responseData;
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.post,
        responseData: responseData,
        params: params,
      );
    }
  }
}
