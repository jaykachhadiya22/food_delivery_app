import 'package:get/get.dart';

import '../../../../../data_modal/product_data_modal/category_product_data_modal.dart';
import '../../../../../locator/locator.dart';
import '../../../../../services/api_calling_service/product_api_calling_service/product_api_calling_service.dart';
import '../all_category_view/all_category_view_modal.dart';


class CategoryViewModal extends GetxController {
  RxBool busiya = false.obs;
  List<CategoryProduct> categoryProduct = [];
  ProductApiCallingService productApiCallingService =
      locator<ProductApiCallingService>();
  AllCategoryViewModal allCategoryViewModal = Get.put(AllCategoryViewModal());

  @override
  void onInit() {
    categoryIndex(allCategoryViewModal.categoryIndex.value);
    busiya.value = false;
    categoryProduct = [];
    super.onInit();
  }

  categoryIndex(int categoryIndex) async {
    String productId = allCategoryViewModal.category[categoryIndex - 1].id;
    categoryProduct = await productApiCallingService.categoryProduct(productId);
    busiya.value = true;
    update();
  }
}
