import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderingView extends StatelessWidget {
  const OrderingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        Text(
          "   Recent activity",
          style: TextStyle(
              color: const Color(0X5FE6E6E8),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        20.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: const Color(0X5FE6E6E5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding:  EdgeInsets.all(15.r),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("asset/images/drink1.jpg",height: 30.h,width: 30.w,fit: BoxFit.fill),
                    20.horizontalSpace,
                    Column(
                      children: [
                        Text("Beef Steak",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: const Color(0XFFE5E5E8),),)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
