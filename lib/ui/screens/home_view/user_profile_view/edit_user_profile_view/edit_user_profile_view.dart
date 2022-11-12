import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_hotel_project/const/color_const.dart';
import '../user_profile_view_modal.dart';
import 'edit_user_profile_view_modal.dart';

// ignore: must_be_immutable
class EditUserProfileView extends StatelessWidget {
  EditUserProfileViewModal editProfileViewModal =
      Get.put(EditUserProfileViewModal());
  UserProfileViewModal userProfileViewModal = Get.put(UserProfileViewModal());

  EditUserProfileView({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
   editProfileViewModal.downlodeUrl= userProfileViewModal.userData?.userImg;
   name.text = userProfileViewModal.userData?.name  ?? "";
   phoneNumber.text = userProfileViewModal.userData?.phone.toString() ?? "";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
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
                    ],
                  ),
                ],
              ),
              25.verticalSpace,
              Center(
                child: Obx(
                  () => editProfileViewModal.imagePath.isEmpty &&
                          userProfileViewModal.userData?.userImg == null
                      ? Icon(
                          Icons.supervised_user_circle_rounded,
                          size: 80.sp,
                        )
                      : (editProfileViewModal.imagePath.isNotEmpty)
                          ? CircleAvatar(
                              radius: 40.r,
                              backgroundImage: Image.file(
                                      File(
                                          editProfileViewModal.imagePath.value),
                                      fit: BoxFit.fill)
                                  .image,
                            )
                          : CircleAvatar(
                              radius: 40.r,
                              backgroundImage: Image.network(
                                      "${userProfileViewModal.userData?.userImg}",
                                      fit: BoxFit.fill)
                                  .image,
                            ),
                ),
              ),
              5.verticalSpace,
              Center(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0.r),
                                topLeft: Radius.circular(0.r))),
                        // backgroundColor: Colors.yellow,
                        builder: (context) {
                          return AttachPhotoDialog();
                        },
                        context: context);
                  },
                  child: Text(
                    "Change profile picture",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: ColorConst.secondaryColor),
                  ),
                ),
              ),
              35.verticalSpace,
              SingleTextField(TextInputType.text, "Enter Full Name", name),
              12.verticalSpace,
              SingleTextField(
                  TextInputType.number, "Phone Number", phoneNumber),
              const Spacer(),
              15.verticalSpace,
              SizedBox(
                height: 40.h,
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
                    onPressed: () async {
                      if (name.text.toString().isNotEmpty &&
                          phoneNumber.text.toString().isNotEmpty &&
                          editProfileViewModal.imagePath != null) {
                        await editProfileViewModal.userUpdateProfile(
                            name.text.toString(), phoneNumber.text.toString());
                        Navigator.pop(context);
                        userProfileViewModal.busiya.value = false;
                        await userProfileViewModal.onInit();
                      } else {
                        Get.snackbar("please complete your profile..", "",
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: Center(
                        child: Text(
                      "Save",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 15.sp),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleTextField extends StatelessWidget {
  TextInputType keyBoredType;
  String hintText;
  TextEditingController controller;

  SingleTextField(this.keyBoredType, this.hintText, this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: keyBoredType,
        decoration: InputDecoration(
          hintText: hintText,
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
            borderSide:
                BorderSide(color: const Color(0X5FDEDEDE), width: 2.0.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0XFFDEDEDE), width: 2.0.w),
            borderRadius: BorderRadius.circular(15.r),
          ),
          contentPadding: EdgeInsets.only(left: 10.w),
          fillColor: Colors.black12,
          filled: true,
        ));
  }
}

// ignore: must_be_immutable
class AttachPhotoDialog extends StatelessWidget {
  AttachPhotoDialog({Key? key}) : super(key: key);
  EditUserProfileViewModal editProfileViewModal =
      Get.put(EditUserProfileViewModal());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                editProfileViewModal
                    .pickImageCameraAndGallery(ImageSource.camera)
                    .then((value) async {
                    if(editProfileViewModal.imagePath.isNotEmpty)
                      {
                        await editProfileViewModal.changeProfileImage();
                      }
                  Navigator.pop(context);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, top: 12),
                child: Row(
                  children: [
                    5.horizontalSpace,
                    Icon(Icons.camera, size: 28.sp, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text("Camera",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 15.sp)),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                editProfileViewModal
                    .pickImageCameraAndGallery(ImageSource.gallery)
                    .then((value) async {
                  if(editProfileViewModal.imagePath.isNotEmpty)
                  {
                    await editProfileViewModal.changeProfileImage();
                  }
                  Navigator.pop(context);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, top: 12),
                child: Row(
                  children: [
                    5.horizontalSpace,
                    Icon(Icons.image, size: 28.sp, color: Colors.black54),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text("Gallery",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 15.sp)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
