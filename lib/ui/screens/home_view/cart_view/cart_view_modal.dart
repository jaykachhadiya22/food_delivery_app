import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:state_hotel_project/services/hive_data_service/hive_data_service.dart';
import '../../../../adapter/adepter_modal.dart';
import '../../../../const/color_const.dart';
import '../../../../locator/locator.dart';
import '../../../../services/payment_service/payment_service.dart';


class CartViewModal extends GetxController {
  RxInt total = 0.obs;
  PaymentService paymentService = locator<PaymentService>();

  @override
  Future<void> onInit() async {
    total.value = 0;
    total.value = await hiveDataService.totalBill();
    paymentService.paymentStatus(
        handlePaymentSuccess, handlePaymentError, handleExternalWallet);

    super.onInit();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.defaultDialog(
        barrierDismissible: false,
        contentPadding: const EdgeInsets.all(0),
        radius: 10,
        titleStyle: TextStyle(fontSize: 0.sp),
        content: Column(
          children: [
            Image.asset(
              "asset/images/payment_successful_logo.png",
              height: 50,
              fit: BoxFit.fill,
            ),
            12.verticalSpace,
            Text(
              "Payment Successfully Completed",
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
            5.verticalSpace,
            Text(
              "Thank you for order",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
            5.verticalSpace,
            Text(
              "Your Order Id:${response.paymentId}",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: SizedBox(
                height: 38.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorConst.secondaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.back(
                        canPop: true,
                        closeOverlays: true,
                      );
                    },
                    child: Center(
                        child: Text(
                      "Completed",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16.sp),
                    ))),
              ),
            ),
          ],
        ));
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Get.defaultDialog(
        barrierDismissible: false,
        contentPadding: const EdgeInsets.all(0),
        radius: 10,
        titleStyle: TextStyle(fontSize: 0.sp),
        content: Column(
          children: [
            Image.asset(
              "asset/images/error_logo.jpg",
              height: 50,
              fit: BoxFit.fill,
            ),
            12.verticalSpace,
            Text(
              "Payment Failed? Retry Now",
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: SizedBox(
                height: 38.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorConst.secondaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Center(
                        child: Text(
                      "RETRY",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16.sp),
                    ))),
              ),
            ),
          ],
        ));
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
  }

  checkout() async {
    paymentService.openCheckout(total.value);
  }

  HiveDataService hiveDataService = locator<HiveDataService>();

  plusQuantity(int index, Todo todo1) async {
    double price = todo1.Price;

    await hiveDataService.plusQuantity(
        todo1.image, todo1.name, price, todo1.id);
  }

  minusQuantity(int index, Todo todo1) async {
    double price = todo1.Price;

    await hiveDataService.minusQuantity(
        todo1.image, todo1.name, price, todo1.id);
  }
}
