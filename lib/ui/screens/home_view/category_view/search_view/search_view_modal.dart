import 'package:get/get.dart';

import '../../../../../data_modal/search_product_data_modal/search_product_data_modal.dart';
import '../../../../../locator/locator.dart';
import '../../../../../services/api_calling_service/search_api_call_services/search_api_call_services.dart';

class SearchViewModal extends GetxController{

  SearchApiCallServices searchApiCallServices =
  locator<SearchApiCallServices>();
  List<SearchProduct> searchProductData =[];
  RxBool busiya = false.obs;
  RxString searchValue ="".obs;

  searchApiCall(String searchProductName)
  async {
    Future.delayed(const Duration(seconds: 2));
    searchProductData= await searchApiCallServices.searchServices(searchProductName);
    busiya.value=true;
      update();
  }
}