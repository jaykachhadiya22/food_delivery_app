import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:state_hotel_project/data_modal/product_data_modal/all_product_data_modal.dart';
import '../../../../../adapter/adepter_modal.dart';
import '../../../../../const/color_const.dart';
import '../category_view/category_view.dart';
import '../search_view/search_view.dart';
import 'all_category_view_modal.dart';

class AllCategoryView extends StatelessWidget {
  final AllCategoryViewModal allCategoryViewModal =
      Get.put(AllCategoryViewModal());
  AllCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: InkWell(
                borderRadius: BorderRadius.circular(15.r),
                onTap: () {
                  Get.to(SearchView());
                },
                child: Container(
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.black12,
                  ),
                  child: Row(
                    children: [
                      15.horizontalSpace,
                      const Icon(Icons.search_rounded,
                          color: Color(0X5F3B3B3B)),
                      10.horizontalSpace,
                      Text(
                        "Find your whereabouts",
                        style: TextStyle(
                            color: const Color(0X5F3B3B3B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: SizedBox(
                height: 35.h,
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allCategoryViewModal.items.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              allCategoryViewModal.categoryIndex.value = index;
                            },
                            child: Obx(
                              () => Container(
                                height: 34.h,
                                decoration: BoxDecoration(
                                  color: allCategoryViewModal
                                              .categoryIndex.value ==
                                          index
                                      ? ColorConst.secondaryColor
                                      : const Color(0XFF33434),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Center(
                                    child: Text(
                                        "    ${allCategoryViewModal.items[index]}    ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600))),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(() => Expanded(
                child: allCategoryViewModal.busiya.value
                    ? (allCategoryViewModal.categoryIndex.value == 0
                        ? AllCategoryItemView()
                        : CategoryView())
                    : const Center(child: CircularProgressIndicator()))),
          ],
        ),
      ),
    ));
  }
}

class AllCategoryItemView extends StatelessWidget {
  AllCategoryItemView({Key? key}) : super(key: key);
  final AllCategoryViewModal allCategoryViewModal =
      Get.put(AllCategoryViewModal());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: 1840,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              " Recommended food 🤓",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp),
            ),
            10.verticalSpace,
            SizedBox(
              height: 190.h,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: allCategoryViewModal.recommended.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        height: 195.h,
                        width: 170.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.network(
                              allCategoryViewModal.recommended[index].image,
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  );
                },
              ),
            ),
            10.verticalSpace,
            Text(
              " People are looking for 🤓",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp),
            ),
            5.verticalSpace,
            Expanded(
                child: ListView.builder(
              itemCount: allCategoryViewModal.allCategoryDataList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SingleAllCategoryItemView(
                  allCategoryViewModal.allCategoryDataList, index),
            )),
          ],
        ),
      ),
    );
  }
}

class SingleAllCategoryItemView extends StatefulWidget {
  final List<AllProductDetail> allCategoryDataList;
  final int index;

  const SingleAllCategoryItemView(this.allCategoryDataList, this.index,
      {Key? key})
      : super(key: key);

  @override
  State<SingleAllCategoryItemView> createState() =>
      _SingleAllCategoryItemViewState();
}

class _SingleAllCategoryItemViewState extends State<SingleAllCategoryItemView> {
  AllCategoryViewModal allCategoryViewModal = Get.put(AllCategoryViewModal());

  @override
  Widget build(BuildContext context) {
    var singleItem = widget.allCategoryDataList[widget.index];
    allCategoryViewModal.checkDataNullOrNot(singleItem);
    return allCategoryViewModal.boxItem != null
        ? ValueListenableBuilder(
            builder: (context, Box<Todo> box, _) {
              Box<Todo> todoBox = Hive.box<Todo>('category');
              String id = singleItem.id;
              Todo? todo1 = todoBox.get(id);
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    todo1!.image,
                    fit: BoxFit.fill,
                    height: 40.h,
                    width: 45.w,
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
                          allCategoryViewModal.deleteItime(id, box);
                          setState(() {});
                        } else {
                          allCategoryViewModal.minusQuantity(singleItem);
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
                        allCategoryViewModal.plusQuantity(singleItem);
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
            leading: ClipRRect(
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
                allCategoryViewModal.addItem(singleItem);
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
