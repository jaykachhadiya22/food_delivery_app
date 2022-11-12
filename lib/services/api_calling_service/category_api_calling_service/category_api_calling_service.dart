import 'package:dio/dio.dart';

import '../../../data_modal/category_data_modal/cataegory_data_modal.dart';

class CategoryApiCallingService {
  category() async {
    List<Datum> categoryList = [];
    try {
      Dio _dio = Dio();
      _dio.options.responseType = ResponseType.plain;
      Response response = await _dio.get('https://seemflow-food-delivery.herokuapp.com/product/category/all');

      CataegoryDataModal category = cataegoryDataModalFromJson(response.data);
      categoryList = category.data;

    } catch (e) {
      print("" + e.toString());
    }
    return categoryList;
  }
}
