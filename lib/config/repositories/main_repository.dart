import 'package:magic_power_sales/config/helpers/api_base_helper.dart';
import 'package:magic_power_sales/config/helpers/log_helper.dart';
import 'package:magic_power_sales/config/models/distributor.dart';
import 'package:magic_power_sales/config/models/product.dart';
import 'package:magic_power_sales/config/models/response_data.dart';
import 'package:magic_power_sales/config/models/slide_banner.dart';
import 'package:magic_power_sales/config/models/transaction.dart';

class MainRepository {
  static final ApiBaseHelper _helper = ApiBaseHelper();
  static Future<List<SlideBanner>> getBanners() async {
    String endpoint = '/sales-banners';
    final Map<String, dynamic> params = {
      "populate": "banner,image_detail",
      "sort[createdAt]": "desc"
    };
    ResponseData? responseData;
    List<SlideBanner> banners = [];
    try {
      responseData = await _helper.get(url: endpoint, data: params);
      if (responseData.code == 200) {
        banners = List<SlideBanner>.from(
            responseData.data['data'].map((e) => SlideBanner.fromJson(e)));
      }
      return banners;
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

  static Future<ResponseData> createDraftTransaction(
      Map<String, dynamic> data) async {
    const String endpoint = '/draft-transactions';
    final Map<String, dynamic> params = data;
    ResponseData? responseData;
    try {
      responseData = await _helper.post(url: endpoint, data: params);
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

  static Future<List<Transaction>> getDraftTransaction() async {
    const String endpoint = '/draft-transactions';
    final Map<String, dynamic> params = {
      "populate[0]": "merchant",
      "populate[1]": "products.product"
    };
    ResponseData? responseData;
    try {
      responseData = await _helper.get(url: endpoint, data: params);
      if (responseData.code == 200) {
        return List<Transaction>.from(responseData.data["data"]["results"]
            .map((e) => Transaction.fromJson(e)));
      }
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.put,
        responseData: responseData,
        params: params,
      );
    }
    return [];
  }

  static Future<List<Product>> getProducts() async {
    const String endpoint = '/products';
    final Map<String, dynamic> params = {
      "populate": "image",
      "filters": {
        "carton_unit": {"\$ne": 0}
      }
    };
    ResponseData? responseData;
    List<Product> products = [];
    try {
      responseData = await _helper.get(url: endpoint, data: params);
      if (responseData.code == 200) {
        products = List<Product>.from(
            responseData.data['data'].map((e) => Product.fromJson(e)));
      }
      return products;
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

  static Future<List<Distributor>> getDistributor() async {
    const String endpoint = '/distributions';
    final Map<String, dynamic> params = {};
    ResponseData? responseData;
    List<Distributor> distributor = [];
    try {
      responseData = await _helper.get(url: endpoint, data: params);
      if (responseData.code == 200) {
        distributor = List<Distributor>.from(
            responseData.data['data'].map((e) => Distributor.fromJson(e)));
      }
      return distributor;
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
