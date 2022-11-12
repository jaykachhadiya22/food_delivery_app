import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../all_category_view/all_category_view_modal.dart';
import '../single_food_item_view/single_food_item_view.dart';
import 'category_view_modal.dart';

class CategoryView extends StatelessWidget {
  CategoryView({Key? key}) : super(key: key);

  CategoryViewModal categoryViewModal = Get.put(CategoryViewModal());
  AllCategoryViewModal allCategoryViewModal = Get.put(AllCategoryViewModal());

  @override
  Widget build(BuildContext context) {
    categoryViewModal.onInit();
    return Obx(() => categoryViewModal.busiya.value
        ? FoodItemView(categoryViewModal.categoryProduct)
        : const Center(
      child: CircularProgressIndicator(),
    ),);
    // return Container();
  }
}
