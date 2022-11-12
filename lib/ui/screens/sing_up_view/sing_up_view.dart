import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_hotel_project/const/color_const.dart';
import 'package:state_hotel_project/ui/screens/sing_up_view/singup_view_modal.dart';


class SingUpView extends StatelessWidget {
  SingUpView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  SingUpViewModal singUpViewModal = Get.put(SingUpViewModal());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.verticalSpace,
                Image.asset(
                  "asset/images/app_logo.jpg",
                  height: 150.h,
                  width: 500.w,
                  fit: BoxFit.fill,
                ),
                30.verticalSpace,
                Text(
                  "Create account",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                20.verticalSpace,
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
                      helperStyle:  TextStyle(color: ColorConst.blackLight),
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
                TextFormField(
                    controller: password,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    //keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      helperStyle:  TextStyle(color:  ColorConst.blackLight),
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
                      fillColor:  ColorConst.blackLight,
                      filled: true,
                    )),
                10.verticalSpace,
                Text(
                  "By tapping Create Account. i angree to the Terms of Service and Private Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color:  ColorConst.blackLight),
                ),
                10.verticalSpace,
                SizedBox(
                  height: 45.h,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all( ColorConst.secondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          singUpViewModal.email.value = email.text;
                          singUpViewModal.password.value = password.text;
                          if (singUpViewModal.emailValidation()) {
                            singUpViewModal.singUpAuth();
                          }
                        }
                      },
                      child: Center(
                          child: Text(
                        "Continue",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16.sp),
                      ))),
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do You account?",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          " Login",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
