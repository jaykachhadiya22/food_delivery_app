import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:state_hotel_project/data_modal/product_data_modal/category_product_data_modal.dart';
import '../../../../../adapter/adepter_modal.dart';
import '../../../../../const/color_const.dart';
import 'single_food_item_view_modal.dart';

class FoodItemView extends StatelessWidget {
 final List<CategoryProduct> foodCategory;

 const FoodItemView(this.foodCategory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: foodCategory.length,
      itemBuilder: (context, index) => SingalFoodItemView(foodCategory, index),
    );
  }
}

class SingalFoodItemView extends StatefulWidget {
 final List<CategoryProduct> foodCategory;
 final int index;

  const SingalFoodItemView(this.foodCategory, this.index, {Key? key})
      : super(key: key);

  @override
  State<SingalFoodItemView> createState() => _SingalFoodItemViewState();
}

class _SingalFoodItemViewState extends State<SingalFoodItemView> {
  SingalFoodItemViewModal singalFoodItemModal =
      Get.put(SingalFoodItemViewModal());

  @override
  Widget build(BuildContext context) {
    var singleItem = widget.foodCategory[widget.index];
    singalFoodItemModal.checkDataNullOrNot(singleItem);
    return singalFoodItemModal.boxItem != null
        ? ValueListenableBuilder(
            builder: (context, Box<Todo> box, _) {
              Box<Todo> todoBox = Hive.box<Todo>('category');
              String id = singleItem.id;
              Todo? todo1 = todoBox.get("$id");
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    todo1!.image,
                    fit: BoxFit.fill,
                    height: 40.h,
                    width: 45.w,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                title: Text(todo1.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp)),
                subtitle: Text("\$ ${todo1.Price.toInt()}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () async {
                        if (todo1.quantity <= 1) {
                          String id = todo1.id;
                          singalFoodItemModal.deleteItime(id, box);
                          setState(() {});
                        } else {
                          singalFoodItemModal.minusQuantity(singleItem);
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 25.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: ColorConst.redLight,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 9.w, right: 9.w),
                          child: Center(
                            child: Divider(
                              thickness: 1.5.w,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "${todo1.quantity}",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: () {
                        singalFoodItemModal.plusQuantity(singleItem);
                        setState(() {});
                      },
                      child: Container(
                        height: 25.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: ColorConst.primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child:
                              Icon(Icons.add, size: 18.sp, color: Colors.black),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ],
                ),
              );
            },
            valueListenable: Hive.box<Todo>('category').listenable())
        : ListTile(
            leading:ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                singleItem.image,
                fit: BoxFit.fill,
                height: 40.h,
                width: 45.w,
              ),
            ),
            title: Text(singleItem.productName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp)),
            subtitle: Text("\$ ${singleItem.varients[0].price}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp)),
            trailing: InkWell(
              onTap: () async {
                // var singleItem = foodCategory[index];

                singalFoodItemModal.addItem(singleItem);
                setState(() {});
              },
              child: Container(
                height: 25.h,
                width: 30.w,
                decoration: BoxDecoration(
                  color: ColorConst.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Icon(Icons.add, size: 18.sp, color: Colors.black),
                ),
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          );
  }
}
