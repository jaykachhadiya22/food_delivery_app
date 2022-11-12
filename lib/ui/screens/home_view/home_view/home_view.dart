import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:state_hotel_project/const/color_const.dart';
import 'package:state_hotel_project/data_modal/product_data_modal/recommended_product_data_modal.dart';
import '../../../../adapter/adepter_modal.dart';
import '../category_view/search_view/search_view.dart';
import 'home_view_modal.dart';
import 'notificatoin_view/notification_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeViewModal homeViewModal = Get.put(HomeViewModal());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "  Isabella 👏",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10.r),
                  onTap: () {
                    Get.to(const NotificationView());
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: ColorConst.redLight,
                    ),
                    child: const Icon(Icons.notifications, color: Colors.red),
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            InkWell(
              borderRadius: BorderRadius.circular(15.r),
              onTap: () {
                Get.to( SearchView());
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
                    const Icon(Icons.search_rounded, color: Color(0X5F3B3B3B)),
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
            20.verticalSpace,
            Obx(
              () => homeViewModal.busiya.value
                  ? Expanded(
                      child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                                height: 150.0,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(seconds: 1),
                                viewportFraction: 1),
                            items: homeViewModal.couponData.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.only(right: 5.w, left: 5.w),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.r),
                                      child: Image.network(i.image,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      }, fit: BoxFit.fill),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          15.verticalSpace,
                          Text(
                            "Recommended food 🤓",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                          15.verticalSpace,
                          GridView.builder(
                              itemBuilder: (context, index) =>
                                  HomeCategoryItemView(
                                      homeViewModal.recommended[index]),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: homeViewModal.recommended.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12,
                                      crossAxisSpacing: 12)),
                        ],
                      ),
                    ))
                  : const Expanded(
                      child: Center(child: CircularProgressIndicator())),
            ),
          ],
        ),
      ),
    ));
  }
}

class HomeCategoryItemView extends StatefulWidget {
  final Product recommended;

  const HomeCategoryItemView(this.recommended, {Key? key}) : super(key: key);

  @override
  State<HomeCategoryItemView> createState() => _HomeCategoryItemViewState();
}

class _HomeCategoryItemViewState extends State<HomeCategoryItemView> {
  HomeViewModal homeViewModal = Get.put(HomeViewModal());

  @override
  Widget build(BuildContext context) {
    homeViewModal.checkDataNullOrNot(widget.recommended);
    return homeViewModal.boxItem != null
        ? ValueListenableBuilder(
            builder: (context, Box<Todo> box, _) {
              Box<Todo> todoBox = Hive.box<Todo>('category');
              String id = widget.recommended.id;
              Todo? todo1 = todoBox.get(id);
              return Container(
                decoration: BoxDecoration(
                  color: ColorConst.redLight,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          todo1!.image,
                          height: 68.h,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      6.verticalSpace,
                      Text(todo1.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14.sp),
                          maxLines: 2),
                      6.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$ ${todo1.Price.toInt()}"),
                          SizedBox(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (todo1.quantity <= 1) {
                                      String id = todo1.id;
                                      homeViewModal.deleteItime(id, box);
                                      setState(() {});
                                    } else {
                                      homeViewModal
                                          .minusQuantity(widget.recommended);
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
                                    homeViewModal
                                        .plusQuantity(widget.recommended);
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
                                      child: Icon(Icons.add,
                                          size: 18.sp, color: Colors.black),
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            valueListenable: Hive.box<Todo>('category').listenable())
        : Container(
            decoration: BoxDecoration(
              color: ColorConst.redLight,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      widget.recommended.image,
                      height: 68.h,
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
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  6.verticalSpace,
                  Text(widget.recommended.productName,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.sp),
                      maxLines: 2),
                  6.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$ ${widget.recommended.varients[0].price}"),
                      InkWell(
                        onTap: () async {
                          homeViewModal.addItem(widget.recommended);
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
                            child: Icon(Icons.add,
                                size: 18.sp, color: Colors.black),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
