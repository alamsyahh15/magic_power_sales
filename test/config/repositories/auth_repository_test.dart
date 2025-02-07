import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  String baseUrl = "http://152.42.179.244:1337/api";
  String jwtToken = "";
  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  ));

  // test calling register method
  // test('register method ...', () async {
  //   const String endpoint = '/auth/register?role=sales';
  //   final request = {
  //     "username": "sales123124",
  //     'full_name': "Sales Studioalva",
  //     "email": "sales@studioalva.co",
  //     "password": "@Password123",
  //     "phone_number": "08123456789",
  //   };
  //   final response = await dio.post(endpoint, data: request);
  //   log("Response register: ${response.data}");
  //   expect(response.statusCode, 200);
  // });

  // test calling login
  test('login method ...', () async {
    final request = {
      "identifier": "sales@studioalva.co",
      "password": "@Password123"
    };
    const String endpoint = '/auth/login';
    final response = await dio.post(endpoint, data: request);
    jwtToken = "Bearer ${response.data['jwt']}";
    log("Response login: ${response.data}");
    expect(response.statusCode, 200);
  });

  // test calling sales banners
  test('sales banners ...', () async {
    const String endpoint = '/sales-banners';
    final response = await dio.get(
      endpoint,
      options: Options(
        headers: {
          "authorization": jwtToken,
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      ),
    );
    prints("Response sales-banners: ${response.data}");
    expect(response.statusCode, 200);
  });

  // test calling draft transaction
  test('draft transaction ...', () async {
    final request = {
      "distribution_id": "1234",
      "no_invoice": "#1010",
      "total_price": 10000,
      "products": [
        {"product": 2, "count": 5}
      ]
    };
    const String endpoint = '/draft-transactions';
    final response = await dio.post(
      endpoint,
      data: request,
      options: Options(
        headers: {
          "authorization": jwtToken,
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      ),
    );
    log("Response draft-transaction: ${response.data}");
    expect(response.statusCode, 200);
  });

  // test fetch draft transaction
  test('fetch draft transaction ...', () async {
    const String endpoint = '/draft-transactions';
    final response = await dio.get(
      endpoint,
      options: Options(
        headers: {
          "authorization": jwtToken,
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
      ),
    );
    log("Response fetch-draft-transaction: ${response.data}");
    expect(response.statusCode, 200);
  });
}
