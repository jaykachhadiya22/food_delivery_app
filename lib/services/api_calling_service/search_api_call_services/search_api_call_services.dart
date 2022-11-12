import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../data_modal/search_product_data_modal/search_product_data_modal.dart';

class SearchApiCallServices {
  searchServices(searchProductName) async {
    SearchProductDataModal? searchProductData;
    try {
      Dio _dio = Dio();
      _dio.options.responseType = ResponseType.plain;
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true));
      Response response = await _dio.get(
          'https://seemflow-food-delivery.herokuapp.com/product/search?q=$searchProductName');

      searchProductData = searchProductDataModalFromJson(response.data);

    } catch (e) {
      print("" + e.toString());
    }


      return searchProductData?.data;

  }
}
