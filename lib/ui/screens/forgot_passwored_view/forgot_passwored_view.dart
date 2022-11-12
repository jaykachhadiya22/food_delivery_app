import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import 'forgot_passwored_view_modal.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key}) : super(key: key);
 final ForgotPasswordViewModal forgotPasswordViewModal =
      Get.put(ForgotPasswordViewModal());
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    email.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
          child: Column(
            children: [
              30.verticalSpace,
              Image.asset(
                "asset/images/app_logo.jpg",
                height: 150.h,
                width: 500.w,
                fit: BoxFit.fill,
              ),
              25.verticalSpace,
              Text(
                "Forgot Passwored",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              25.verticalSpace,
              TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  //keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    helperStyle: TextStyle(color: ColorConst.blackLight),
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
                          color: const Color(0X5FDEDEDE), width: 2.0.w),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    contentPadding: EdgeInsets.only(left: 10.w, top: 30.h),
                    fillColor: ColorConst.blackLight,
                    filled: true,
                  )),
              20.verticalSpace,
              SizedBox(
                height: 45.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorConst.secondaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        forgotPasswordViewModal.email.value = email.text;
                        if (forgotPasswordViewModal.emailValidation()) {
                          forgotPasswordViewModal.forgotPassword();
                        }
                      }
                    },
                    child: Center(
                        child: Text(
                      "Send Email",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16.sp),
                    ))),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
