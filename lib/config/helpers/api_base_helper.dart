import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:magic_power_sales/config/config.dart';
import 'package:magic_power_sales/config/constant.dart';
import 'package:magic_power_sales/config/custom_snackbar.dart';
import 'package:magic_power_sales/config/data/local_db.dart';
import 'package:magic_power_sales/config/helpers/log_helper.dart';
import 'package:magic_power_sales/config/models/response_data.dart';

enum Method { post, get, put, delete, notif }

class ApiBaseHelper {
  Dio init(
      {String contentType = "application/json",
      String? customUrl,
      Method? method}) {
    log("Jwt Token -> ${LocalDB.user.jwt}");

    Dio dio = Dio(BaseOptions(
      baseUrl: customUrl ?? Strings.baseUrl,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      headers: {
        "Content-Type": contentType,
        "Accept": "application/json",
        'authorization': 'Bearer ${LocalDB.user.jwt ?? ""}',
      },
    ));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //continue
    }, onResponse: (response, handler) async {
      return handler.next(response); // continue
    }, onError: (DioException e, handler) async {
      if (e.response?.data['error']['status'] == 401) {
        showInSnackBar("Sesi login anda telah berakhir !");
        LocalDB.authGuard(false);
        return;
      } else {
        try {
          showInSnackBar(e.response?.data["message"]);
        } catch (error) {
          loge(
            error: e,
            endpoint: "${e.response?.realUri}",
            method: method ?? Method.post,
            params: e.requestOptions.queryParameters,
            data: e.requestOptions.data,
          );
        }

        ///? ======= Implement send to crashlytics ==========
        await FirebaseCrashlytics.instance.recordError(
          e.response?.statusMessage,
          StackTrace.current,
          reason: 'Http/DioError',
          information: [],
          printDetails: true,
        );

        return handler.next(e);
      }
    }));
    return dio;
  }

  Future<ResponseData> post({
    required String url,
    dynamic data,
    String contentType = "application/json",
  }) async {
    ResponseData responseData = const ResponseData();
    Dio dio = init(contentType: contentType, method: Method.post);
    Response response;
    try {
      if (!url.startsWith('/')) url = '/$url';
      response = await dio.post("${Strings.baseUrl}$url", data: data);
      responseData = ResponseData(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage,
      );
      Log.success(response);
    } on DioException catch (error) {
      loading.value = false;
      log("Url Endpoint => ${error.response?.realUri.toString()}",
          error: "Request => $data\nError => ${error.response?.data}");
      responseData = ResponseData.fromJson(error.response?.data);
      await sendLog(error: error, url: url, data: data);
    } catch (error) {
      loading.value = false;
      loge(
        error: error,
        endpoint: url,
        method: Method.post,
        params: data,
        responseData: responseData,
      );
    }
    await validateToken(responseData);
    return responseData;
  }

  Future<ResponseData> get(
      {required String url, Map<String, dynamic>? data}) async {
    ResponseData responseData = const ResponseData();
    Dio dio = init(method: Method.get);
    try {
      if (!url.startsWith('/')) url = '/$url';
      Response response = await dio.get(url, queryParameters: data);
      responseData = ResponseData(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage,
      );
      Log.success(response);
    } on DioException catch (error) {
      await sendLog(error: error, url: url, data: data);

      if (!isEmpty(error.response?.data)) {
        responseData = ResponseData.fromJson(error.response?.data);
        loge(
          error: error,
          endpoint: url,
          method: Method.get,
          params: data,
          responseData: responseData,
        );
      }
    } catch (error) {
      loge(
        error: error,
        endpoint: url,
        method: Method.get,
        params: data,
        responseData: responseData,
      );
    }
    await validateToken(responseData);
    return responseData;
  }

  Future<ResponseData> put({required String url, dynamic data}) async {
    ResponseData responseData = const ResponseData();
    Dio dio = init(method: Method.put);
    Response response;
    try {
      if (!url.startsWith('/')) url = '/$url';
      response = await dio.put(url, data: data);
      responseData = ResponseData(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage,
      );
      Log.success(response);
    } on DioException catch (error) {
      // log("Url Endpoint => ${error.response?.realUri.toString()}",
      //     error: "Request => $data\nError => ${error.response?.data}");
      responseData = ResponseData.fromJson(error.response?.data);
      await sendLog(error: error, url: url, data: data);
    } catch (error) {
      loge(
        error: error,
        endpoint: url,
        method: Method.put,
        params: data,
        responseData: responseData,
      );
    }
    await validateToken(responseData);
    return responseData;
  }

  Future<ResponseData> delete({required String url, dynamic data}) async {
    ResponseData responseData = const ResponseData();
    Dio dio = init(method: Method.put);
    Response response;
    try {
      if (!url.startsWith('/')) url = '/$url';
      response = await dio.delete(url, data: data);
      responseData = ResponseData(
        code: response.statusCode,
        data: response.data,
        message: response.statusMessage,
      );
      Log.success(response);
    } on DioException catch (error) {
      // log("Url Endpoint => ${error.response?.realUri.toString()}",
      //     error: "Request => $data\nError => ${error.response?.data}");
      responseData = ResponseData.fromJson(error.response?.data);
      await sendLog(error: error, url: url, data: data);
    } catch (error) {
      loge(
        error: error,
        endpoint: url,
        method: Method.delete,
        params: data,
        responseData: responseData,
      );
    }
    await validateToken(responseData);
    return responseData;
  }

  validateToken(ResponseData responseData) async {}
}
