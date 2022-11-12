import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:state_hotel_project/data_modal/coupon_data_modal/coupon_data_modal.dart';
import '../../../../adapter/adepter_modal.dart';
import '../../../../data_modal/product_data_modal/recommended_product_data_modal.dart';
import '../../../../locator/locator.dart';
import '../../../../services/api_calling_service/coupon_api_calling_service/coupon_api_calling_service.dart';
import '../../../../services/api_calling_service/product_api_calling_service/product_api_calling_service.dart';
import '../../../../services/hive_data_service/hive_data_service.dart';

class HomeViewModal extends GetxController {
  List<Product> recommended = [];
    List<Coupon> couponData = [];
  RxBool busiya = false.obs;
  Todo? boxItem;
  HiveDataService hiveData = locator<HiveDataService>();

  ProductApiCallingService productApiCallingService =
      locator<ProductApiCallingService>();
  CouponApiCallingService couponApiCallingService =
      locator<CouponApiCallingService>();

  @override
  Future<void> onInit() async {
    await couponApi();
    await recommendedFood();
    busiya.value = true;
    super.onInit();
  }

  checkDataNullOrNot(Product recommended) async {
    Box<Todo> todoBox = Hive.box<Todo>('category');
    String id = recommended.id;
    Todo? todo = todoBox.get(id);
    boxItem = todo;
    update();
  }

  couponApi() async {
    couponData = await couponApiCallingService.couponApiCalling();
    update();
  }

  recommendedFood() async {
    recommended = await productApiCallingService.recommendedFood();
    update();
  }

  addItem(Product recommended) async {
    await hiveData.addData(recommended.id, recommended.image,
        recommended.productName, recommended.varients[0].price.toDouble());
  }

  plusQuantity(Product recommended) async {
    int m = recommended.varients[0].price;
    double price = m.toDouble();

    await hiveData.plusQuantity(
        recommended.image, recommended.productName, price, recommended.id);
  }

  minusQuantity(Product recommended) async {
    int m = recommended.varients[0].price;
    double price = m.toDouble();

    await hiveData.minusQuantity(
        recommended.image, recommended.productName, price, recommended.id);
  }

  deleteItime(String id, Box<Todo> box) async {
    await hiveData.deleteItime(box, id);
  }
}
