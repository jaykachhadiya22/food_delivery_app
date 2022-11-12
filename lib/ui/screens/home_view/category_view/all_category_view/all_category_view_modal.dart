import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:state_hotel_project/data_modal/product_data_modal/recommended_product_data_modal.dart';
import '../../../../../adapter/adepter_modal.dart';
import '../../../../../data_modal/category_data_modal/cataegory_data_modal.dart';
import '../../../../../data_modal/product_data_modal/all_product_data_modal.dart';
import '../../../../../locator/locator.dart';
import '../../../../../services/api_calling_service/category_api_calling_service/category_api_calling_service.dart';
import '../../../../../services/api_calling_service/product_api_calling_service/product_api_calling_service.dart';
import '../../../../../services/hive_data_service/hive_data_service.dart';


class AllCategoryViewModal extends GetxController {
  RxInt categoryIndex = 0.obs;
  Todo? boxItem;
  RxBool busiya = false.obs;
  List<Datum> category = [];
  List<Product> recommended = [];
  RxList items = [].obs;
  List<AllProductDetail> allCategoryDataList = [];
  HiveDataService hiveData = locator<HiveDataService>();
  CategoryApiCallingService categoryApiCallingService =
      locator<CategoryApiCallingService>();

  ProductApiCallingService productApiCallingService =
      locator<ProductApiCallingService>();

  @override
  Future<void> onInit() async {
    await categoryApi();

    items.add('All');
    for (int i = 0; i < category.length; i++) {
      items.add(category[i].name);
    }
    await recommendedFood();
    await allCategoryData();
    busiya.value = true;
    super.onInit();
  }

  Future<void> categoryApi() async {
    category = await categoryApiCallingService.category();
    update();
  }

  recommendedFood() async {
    recommended = await productApiCallingService.recommendedFood();
    update();
  }

  allCategoryData() async {
    allCategoryDataList = await productApiCallingService.allProductCategory();
    update();
  }

  checkDataNullOrNot(AllProductDetail singleItem) async {
    Box<Todo> todoBox = Hive.box<Todo>('category');
    String id = singleItem.id;
    print(id);
    Todo? todo = todoBox.get("$id");
    boxItem = todo;
    update();
  }

  addItem(AllProductDetail singleItem) async {
    await hiveData.addData(singleItem.id, singleItem.image,
        singleItem.productName, singleItem.varients[0].price.toDouble());
  }

  plusQuantity(AllProductDetail singleItem) async {
    int m = singleItem.varients[0].price;
    double price = m.toDouble();

    await hiveData.plusQuantity(
        singleItem.image, singleItem.productName, price, singleItem.id);
  }

  minusQuantity(AllProductDetail singleItem) async {
    int m = singleItem.varients[0].price;
    double price = m.toDouble();

    await hiveData.minusQuantity(
        singleItem.image, singleItem.productName, price, singleItem.id);
  }

  deleteItime(String id, Box<Todo> box) async {
    await hiveData.deleteItime(box, id);
  }
}
