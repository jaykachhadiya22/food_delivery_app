import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_hotel_project/ui/screens/home_view/category_view/search_view/search_view_modal.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final SearchViewModal searchViewModal = Get.put(SearchViewModal());
  final TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    print("jay");
                    searchViewModal.searchProductData = [];
                    searchViewModal.busiya.value = false;
                    print("${searchViewModal.busiya.value}");
                    searchViewModal.searchValue.value = "";
                  }
                  if (value.isNotEmpty) {
                    searchViewModal.searchApiCall(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: const Color(0X5F3B3B3B),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  helperStyle: const TextStyle(color: Colors.black12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(
                        color: const Color(0X5FDEDEDE), width: 2.0.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0XFFDEDEDE), width: 2.0.w),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  prefixIcon:
                      const Icon(Icons.search, color: Color(0X5F3B3B3B)),
                  contentPadding: EdgeInsets.only(left: 10.w),
                  fillColor: Colors.black12,
                  filled: true,
                )),
            15.verticalSpace,
            Text(
              "Search Product",
              style: TextStyle(
                  fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            20.verticalSpace,
            Obx(
              () => searchViewModal.busiya.value
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchViewModal.searchProductData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30.r,
                            backgroundImage: Image.network(
                              searchViewModal.searchProductData[index].image,
                            ).image,
                          ),
                          title: Text(searchViewModal
                              .searchProductData[index].productName),
                          subtitle: Text(
                              "\$ ${searchViewModal.searchProductData[index].varients[0].price}"),
                        );
                      },
                    )
                   : Expanded(
                    child: Center(
                        child: Text(
                        "",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      )
                     ),
                  ),
            ),
          ],
        ),
      ),
    ));
  }
}
