import 'package:dio/dio.dart';
import '../../../data_modal/product_data_modal/all_product_data_modal.dart';
import '../../../data_modal/product_data_modal/category_product_data_modal.dart';
import '../../../data_modal/product_data_modal/recommended_product_data_modal.dart';

class ProductApiCallingService {
  recommendedFood() async {
    List<Product> categoryList = [];
    try {
      Dio _dio = Dio();
      _dio.options.responseType = ResponseType.plain;
      Response response = await _dio.get(
          'https://seemflow-food-delivery.herokuapp.com/product/recommended');

      RecommendedProductDataModal recommendedFood =
          recommendedProductDataModalFromJson(response.data);

      categoryList = recommendedFood.data;
    } catch (e) {
      print("" + e.toString());
    }
    return categoryList;
  }

  allProductCategory() async {
    AllProductDataModal? allProductData;
    try {
      Dio _dio = Dio();
      _dio.options.responseType = ResponseType.plain;
      Response response = await _dio
          .get('https://seemflow-food-delivery.herokuapp.com/product/all');

      allProductData = allProductDataModalFromJson(response.data);
    } catch (e) {
      print("" + e.toString());
    }
    return allProductData!.data;
  }

  categoryProduct(String productId) async {
    List<CategoryProduct> categoryProduct = [];
    try {
      Dio _dio = Dio();
      _dio.options.responseType = ResponseType.plain;
      Response response = await _dio.get(
          'https://seemflow-food-delivery.herokuapp.com/product/filter?catId=$productId');

      CategoryProductDataModal categoryProductDataModal =
          categoryProductDataModalFromJson(response.data);
      categoryProduct = categoryProductDataModal.data;
      print(categoryProduct[0].image);
    } catch (e) {
      print("" + e.toString());
    }
    return categoryProduct;
  }
}
