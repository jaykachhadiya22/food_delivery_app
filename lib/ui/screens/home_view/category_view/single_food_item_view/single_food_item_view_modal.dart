import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:state_hotel_project/data_modal/product_data_modal/category_product_data_modal.dart';
import '../../../../../adapter/adepter_modal.dart';
import '../../../../../locator/locator.dart';
import '../../../../../services/hive_data_service/hive_data_service.dart';


class SingalFoodItemViewModal extends GetxController {
  HiveDataService hiveData = locator<HiveDataService>();
  Todo? boxItem;

  addItem(CategoryProduct singleItem) async {
    await hiveData.addData(singleItem.id, singleItem.image,
        singleItem.productName, singleItem.varients[0].price.toDouble());
  }

  plusQuantity(CategoryProduct singleItem) async {
    int m = singleItem.varients[0].price;
    double price = m.toDouble();

    await hiveData.plusQuantity(
        singleItem.image, singleItem.productName, price, singleItem.id);
  }

  minusQuantity(CategoryProduct singleItem) async {
    int m = singleItem.varients[0].price;
    double price = m.toDouble();

    await hiveData.minusQuantity(
        singleItem.image, singleItem.productName, price, singleItem.id);
  }

  checkDataNullOrNot(CategoryProduct singleItem) async {
    Box<Todo> todoBox = Hive.box<Todo>('category');
    String id = singleItem.id;
    Todo? todo = todoBox.get("$id");
    boxItem = todo;
    update();
  }

  deleteItime(String id, Box<Todo> box) async {
    await hiveData.deleteItime(box, id);
  }
}
