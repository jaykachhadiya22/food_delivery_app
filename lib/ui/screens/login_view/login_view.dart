import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../forgot_passwored_view/forgot_passwored_view.dart';
import '../sing_up_view/sing_up_view.dart';
import 'login_view_modal.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginViewModal loginViewModal = Get.put(LoginViewModal());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
            content: Text("Tap back again to leave"),
            backgroundColor: Colors.grey,
            elevation: 5),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                    "Login or sing up for free",
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
                        fillColor: Colors.black12,
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
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          Get.off(ForgotPasswordView());
                        },
                        child: Text("Forgot Password",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp)),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  SizedBox(
                    height: 45.h,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ColorConst.secondaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            loginViewModal.email.value = email.text;
                            loginViewModal.password.value = password.text;
                            if (loginViewModal.emailValidation()) {
                              await loginViewModal.loginAuth();
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
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't?t have account?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SingUpView();
                              },
                            ));
                          },
                          child: Text(
                            " Sing up",
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
      ),
    ));
  }
}
