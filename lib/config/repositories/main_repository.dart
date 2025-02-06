import 'package:magic_power_sales/config/helpers/api_base_helper.dart';
import 'package:magic_power_sales/config/helpers/log_helper.dart';
import 'package:magic_power_sales/config/models/response_data.dart';
import 'package:magic_power_sales/config/models/slide_banner.dart';

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

  static Future<ResponseData> getDraftTransaction() async {
    const String endpoint = '/draft-transactions';
    final Map<String, dynamic> params = {};
    ResponseData? responseData;
    try {
      responseData = await _helper.get(url: endpoint);
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
}
