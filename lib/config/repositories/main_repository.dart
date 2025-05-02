import 'package:magic_power_sales/config/helpers/api_base_helper.dart';
import 'package:magic_power_sales/config/helpers/log_helper.dart';
import 'package:magic_power_sales/config/models/area_code.dart';
import 'package:magic_power_sales/config/models/customer.dart';
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
    Map<String, dynamic> params = {
      "populate[0]": "merchant",
      "populate[1]": "products.product",
      "pagination[pageSize]": 25
    };
    ResponseData? responseData;
    int page = 1;
    int pageCount = 1;
    List<Transaction> transactions = [];

    try {
      do {
        params['pagination[page]'] = page;
        responseData = await _helper.get(url: endpoint, data: params);
        if (responseData.code == 200) {
          final temp = List<Transaction>.from(responseData.data["data"]
                  ["results"]
              .map((e) => Transaction.fromJson(e)));
          transactions.addAll(temp);
          pageCount = responseData.data['data']['pagination']['pageCount'];
          page++;
        }
      } while (page <= pageCount);
    } catch (error) {
      throw loge(
        error: error,
        endpoint: endpoint,
        method: Method.put,
        responseData: responseData,
        params: params,
      );
    }
    return transactions;
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

  static Future<List<Customer>> getCustomers({
    String? distributorId,
    String? areaCode,
    int? page = 1,
  }) async {
    const String endpoint = '/customers';
    Map<String, dynamic> params = {
      "distribution_id": distributorId ?? "",
      "area_code": areaCode ?? "",
      "page": page,
      "limit": 10,
    };
    ResponseData? responseData;
    List<Customer> customers = [];
    try {
      responseData = await _helper.get(url: endpoint, data: params);
      if (responseData.code == 200) {
        customers = List<Customer>.from(
            responseData.data['data'].map((e) => Customer.fromJson(e)));
      }
      return customers;
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

  static Future<List<AreaCode>> getAreaCodes({
    String? distributorId,
    String? areaCode,
    int? page = 1,
  }) async {
    const String endpoint = '/area-codes';
    final Map<String, dynamic> params = {"pagination[pageSize]": 100};
    ResponseData? responseData;
    List<AreaCode> areaCodes = [];
    int page = 1;
    int pageCount = 1;
    try {
      do {
        params['pagination[page]'] = page;
        responseData = await _helper.get(url: endpoint, data: params);
        if (responseData.code == 200) {
          final temp = List<AreaCode>.from(
              responseData.data['data'].map((e) => AreaCode.fromJson(e)));
          areaCodes.addAll(temp);
          pageCount = responseData.data['meta']['pagination']['pageCount'];
          page++;
        }
      } while (page <= pageCount);
      areaCodes.sort((a, b) => a.name.compareTo(b.name));
      return areaCodes;
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
}
