import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:state_hotel_project/const/color_const.dart';
import 'fragment/ordering_view/ordering_view.dart';
import 'fragment/promo_view/promo_view.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 15.w,right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text("Notification",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w600,color: const Color(0XFF181818)),),
              25.verticalSpace,
              Container(
                height: 35.h,
                decoration: BoxDecoration(
                  color: const Color(0XFFE6E6E8),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: TabBar(
                    physics: const BouncingScrollPhysics(),

                      unselectedLabelColor: Colors.black54,
                      indicatorColor: Colors.white,
                     // isScrollable: true,
                      indicator: BoxDecoration(
                        color: ColorConst.secondaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      tabs: [
                        SingleTabeCategory("Promo"),
                        SingleTabeCategory("Ordering"),
                      ]),
                ),
              ),

                 const Expanded(
                child: TabBarView(children: [
                  PromoView(),
                  OrderingView(),
                ]),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget SingleTabeCategory(String tabName)
  {
    return Tab(
        child: Text(
          tabName,
          style:  TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500),
        ));
  }
}
