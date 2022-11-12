import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_hotel_project/const/color_const.dart';
import 'package:state_hotel_project/ui/screens/home_view/user_profile_view/address_view/address_view.dart';
import 'package:state_hotel_project/ui/screens/home_view/user_profile_view/user_profile_view_modal.dart';
import '../../../../main.dart';
import '../../login_view/login_view.dart';
import 'edit_user_profile_view/edit_user_profile_view.dart';

// ignore: must_be_immutable
class UserProfileView extends StatelessWidget {
  UserProfileView({Key? key}) : super(key: key);
  UserProfileViewModal userProfileViewModal = Get.put(UserProfileViewModal());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => userProfileViewModal.busiya.value
            ? Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                      ),
                      Text(
                        "Edit and manage your account",
                        style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp),
                      ),
                      40.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorConst.redLight,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // userProfileViewModal.userData?.userImg.isEmpty ?
                                  CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage: userProfileViewModal
                                                .userData?.userImg ==
                                            null
                                        ? Image.asset(
                                                "asset/images/userImage.png")
                                            .image
                                        : Image.network(
                                            "${userProfileViewModal.userData?.userImg ?? ""} ",
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                      backgroundColor: Colors.lime,
                                                ),
                                              );
                                            },
                                          ).image,
                                  ),
                                  20.horizontalSpace,
                                  Text(
                                    "${userProfileViewModal.userData?.name ?? "Edit your Profile"} ",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return EditUserProfileView();
                                        },
                                      ));
                                    },
                                    child: Icon(Icons.edit, size: 20.sp),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Colors.black54),
                              ),
                              Text(
                                "${userProfileViewModal.userData?.email}",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              20.verticalSpace,
                              Text(
                                "Phone",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Colors.black54),
                              ),
                              Text(
                                "${userProfileViewModal.userData?.phone ?? "Add Your Mobil Number"} ",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              20.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          Get.to(AddressView());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                width: 1.w,
                                color: const Color(0xffE6E6E6),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.all(15.sm),
                            child: Row(
                              children: [
                                5.horizontalSpace,
                                Container(
                                    decoration: BoxDecoration(
                                        color: ColorConst.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.sm),
                                      child: const Icon(
                                        Icons.location_on_sharp,
                                        color: Colors.white,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w),
                                  child: Text(
                                    "Address",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey.shade800),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  width: 1.w, color: const Color(0xffE6E6E6))),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, right: 10.w, top: 8.h),
                                child: const Fields(
                                  "Share App",
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.h,
                                width: double.maxFinite,
                                color: Colors.grey[100],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: const Fields(
                                  "Rate Us",
                                  Icon(
                                    Icons.star_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.h,
                                width: double.maxFinite,
                                color: Colors.grey[100],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          logoutDialog(context, userProfileViewModal);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                width: 1.w,
                                color: const Color(0xffE6E6E6),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.all(15.sm),
                            child: Row(
                              children: [
                                5.horizontalSpace,
                                Container(
                                    decoration: BoxDecoration(
                                        color: ColorConst.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.sm),
                                      child: const Icon(
                                        Icons.exit_to_app,
                                        color: Colors.white,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w),
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey.shade800),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

class Fields extends StatelessWidget {
  final String name;
  final Icon icon;

  const Fields(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(10.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: ColorConst.primaryColor,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.sm),
                      child: icon,
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey.shade800),
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              CupertinoIcons.forward,
              color: Colors.blueGrey.shade300,
            )
          ],
        ),
      ),
    );
  }
}

logoutDialog(
  BuildContext context,
  UserProfileViewModal userProfileViewModal,
) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
    ),
    insetPadding: EdgeInsets.only(left: 15.w, right: 15.w),
    scrollable: true,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Logout",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
        ),
        10.verticalSpace,
        Text(
          "Are you sure, do you want to logout",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87),
        ),
      ],
    ),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "No",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue),
          )),
      TextButton(
          onPressed: () async {
            await foodBox.clear();
            userProfileViewModal.singOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return LoginView();
              },
            ), (route) => false);
          },
          child: Text(
            "Yes",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue),
          )),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
