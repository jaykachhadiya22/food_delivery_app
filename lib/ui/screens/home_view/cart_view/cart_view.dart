import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_hotel_project/adapter/adepter_modal.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:state_hotel_project/const/color_const.dart';

import 'cart_view_modal.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  CartViewModal cartViewModal = Get.put(CartViewModal());

  @override
  Widget build(BuildContext context) {
    cartViewModal.onInit();
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 5.w, top: 30.h, right: 5.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: ColorConst.primaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_cart_rounded,
                            size: 24.sp, color: Colors.red),
                      ),
                    ),
                    Text(
                      "Reorder details",
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ValueListenableBuilder(
                  valueListenable: Hive.box<Todo>('category').listenable(),
                  builder: (context, Box<Todo> box, _) {
                    if (box.values.isEmpty) {
                      return SizedBox(
                        height: 360.h,
                        width: double.infinity,
                        child: Center(
                          child: Text("No data available!",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 315.h,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            Todo? todo = box.getAt(index);
                            String id = todo!.id;
                            Todo? todo1 = box.get("$id");
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.network(
                                  todo.image,
                                  fit: BoxFit.fill,
                                  height: 40.h,
                                  width: 45.w,
                                ),
                              ),
                              title: Text(todo.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp)),
                              subtitle: Text("\$ ${todo.Price}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp)),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      if (todo1!.quantity <= 1) {
                                        await box.delete("$id");
                                        cartViewModal.onInit();
                                      } else {
                                        await cartViewModal.minusQuantity(
                                            index, todo1);
                                        cartViewModal.onInit();
                                      }
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        color: const Color(0XFF33434),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 9.w, right: 9.w),
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
                                    "${todo.quantity}",
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
                                      cartViewModal.plusQuantity(index, todo1!);
                                      cartViewModal.onInit();
                                    },
                                    child: Container(
                                      height: 25.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        color: ColorConst.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Center(
                                        child: Icon(Icons.add,
                                            size: 18.sp, color: Colors.black),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "-------------------------------------",
                style:
                    TextStyle(color: const Color(0XFFF33434), fontSize: 14.h),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount",
                      style: TextStyle(
                          fontSize: 14.h,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "\$ ${0.0}",
                      style: TextStyle(
                          fontSize: 14.h,
                          color: ColorConst.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 18.h,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Obx(() => Text("\$ ${cartViewModal.total.value}",
                        style: TextStyle(
                            fontSize: 18.h,
                            color: ColorConst.black,
                            fontWeight: FontWeight.w600))),
                  ],
                ),
              ),
              25.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: SizedBox(
                  height: 40.h,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            ColorConst.secondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        await cartViewModal.checkout();
                      },
                      child: Center(
                          child: Text(
                        "Check out",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 15.sp),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
