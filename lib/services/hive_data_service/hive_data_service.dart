import 'package:hive/hive.dart';
import 'package:state_hotel_project/data_modal/product_data_modal/all_product_data_modal.dart';
import '../../adapter/adepter_modal.dart';

class HiveDataService {
  Box<Todo> todoBox = Hive.box<Todo>('category');

  addData(String id, String image, String productName, double price) async {
    await todoBox.put("$id", Todo(image, productName, price, id, 1));
  }

  plusQuantity(String image, String name, double price, String id) async {
    Todo? todo = todoBox.get("$id");
    if (todo == null) return;
    todo.quantity++;
    todoBox.put("$id", Todo(image, name, price, id, todo.quantity));
  }

  minusQuantity(String image, String name, double price, String id) async {
    Todo? todo = todoBox.get("$id");
    if (todo == null) return;
    todo.quantity--;
    todoBox.put("$id", Todo(image, name, price, id, todo.quantity));
  }

  deleteItime(Box<Todo> box, String id) async {
    await box.delete("$id");
  }

  totalBill() {
    int total = 0;
    for (int i = 0; i < todoBox.length; i++) {
      Todo? todo = todoBox.getAt(i);
      int quantity = todo!.quantity;
      double price = todo.Price;
      int finalPrice = price.toInt();
      total += finalPrice * quantity;
    }
    return total;
  }
}
