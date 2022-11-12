import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_hotel_project/const/color_const.dart';
import 'package:state_hotel_project/ui/screens/home_view/user_profile_view/address_view/address_view_modal.dart';

class AddressView extends StatelessWidget {
  AddressView({Key? key}) : super(key: key);
  AddressViewModal addressViewModal = Get.put(AddressViewModal());
  TextEditingController line = TextEditingController();
  TextEditingController locality = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pinCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF3F5F9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.all(18.sm),
              child: const Icon(CupertinoIcons.back, color: Colors.black),
            ),
          ),
          centerTitle: true,
          title: Text("Select Address",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: const Color(0xff3B3B43),
                  fontWeight: FontWeight.w400)),
          actions: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        // barrierColor: Colors.transparent,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.r),
                                topLeft: Radius.circular(10.r))),
                        builder: (context) {
                          return AddAddressDialog();
                        },
                        context: context);
                  },
                  child: Text("Add",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4CAF50))),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Obx(
          () => addressViewModal.busiya.value
              ? (addressViewModal.userData?.address == null
                  ? Center(
                      child: Text("Add Your Address",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16.sp)),
                    )
                  : ListView.builder(
                      itemCount: addressViewModal.userData?.address?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 15.h, bottom: 5.h, left: 15.w, right: 15.w),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: ExpandablePanel(
                                  theme: ExpandableThemeData(
                                    iconPadding:
                                        EdgeInsets.only(top: 40.h, right: 15.w),
                                    collapseIcon:
                                        CupertinoIcons.chevron_up_circle,
                                    expandIcon:
                                        CupertinoIcons.chevron_down_circle,
                                    iconColor: Colors.green,
                                    iconSize: 26.sp,
                                  ),
                                  header: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.w, top: 15.h),
                                          child: CircleAvatar(
                                            radius: 28.r,
                                            backgroundColor:
                                                const Color(0xffEDF8E4),
                                            child: const Icon(
                                                Icons.location_on_outlined,
                                                color: Color(0xff4CAF50)),
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${addressViewModal.userData?.address?[index]['type']}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14.sp),
                                                ),
                                                Text(
                                                  //    print(dataModel?.data.address![1]['type']);
                                                  "${addressViewModal.userData?.address?[index]['line']}\n${addressViewModal.userData?.address?[index]['locality']} ${addressViewModal.userData?.address?[index]['city']}\n${addressViewModal.userData?.address?[index]['state']}\n${addressViewModal.userData?.address?[index]['pincode']}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12.sp,
                                                      color: Colors.black54),
                                                ),
                                                Text(
                                                  "EDIT",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 11.sp,
                                                      color: Colors.green),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  collapsed: SizedBox(height: 0.h),
                                  expanded: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextFild("House No,Building Name",
                                            TextInputType.text, line),
                                        TextFild("Road name,Area,Colony",
                                            TextInputType.text, locality),
                                        TextFild(
                                            "City", TextInputType.text, city),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFild(
                                                  "PinCode",
                                                  TextInputType.number,
                                                  pinCode),
                                            ),
                                            Expanded(
                                              child: TextFild("State",
                                                  TextInputType.text, state),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.h, bottom: 10.h),
                                          child: Row(
                                            children: [
                                              const Spacer(),
                                              TextButton(
                                                onPressed: () async {
                                                  await addressViewModal
                                                      .deleteUserAddress(
                                                          addressViewModal
                                                                  .userData
                                                                  ?.address?[
                                                              index]['add_id']);
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 28.w),
                                                  child: Text(
                                                    "DELETE",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  if (line.text.isNotEmpty &&
                                                      locality
                                                          .text.isNotEmpty &&
                                                      city.text.isNotEmpty &&
                                                      pinCode.text.isNotEmpty &&
                                                      state.text.isNotEmpty) {
                                                    await addressViewModal
                                                        .updateUserAddress(
                                                            line.text
                                                                .toString(),
                                                            addressViewModal
                                                                        .userData
                                                                        ?.address?[
                                                                    index]
                                                                ['add_id'],
                                                            locality.text
                                                                .toString(),
                                                            city.text
                                                                .toString(),
                                                            pinCode.text
                                                                .toString(),
                                                            state.text
                                                                .toString());
                                                  } else {
                                                    Get.snackbar(
                                                        "please Fill Your Address..",
                                                        "",
                                                        snackPosition:
                                                            SnackPosition
                                                                .BOTTOM);
                                                  }
                                                },
                                                child: Text(
                                                  "SAVE",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: ColorConst
                                                          .primaryColor),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ))
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        )));
  }
}

// ignore: must_be_immutable
class AddAddressDialog extends StatelessWidget {
  AddAddressDialog({Key? key}) : super(key: key);
  TextEditingController line = TextEditingController();
  TextEditingController locality = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  AddressViewModal addressViewModal = Get.put(AddressViewModal());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sm),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Text(
            "  Add Address",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
          ),
          10.verticalSpace,
          Row(
            children: [
              SingleRadioButton("Home"),
              SingleRadioButton("Office"),
              SingleRadioButton("Other"),
            ],
          ),
          10.verticalSpace,
          TextFild("House No,Building Name", TextInputType.text, line),
          TextFild("Road name,Area,Colony", TextInputType.text, locality),
          TextFild("City", TextInputType.text, city),
          Row(
            children: [
              Expanded(
                child: TextFild("PinCode", TextInputType.number, pinCode),
              ),
              Expanded(
                child: TextFild("State", TextInputType.text, state),
              ),
            ],
          ),
          10.verticalSpace,
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
                  if (line.text.isNotEmpty &&
                      locality.text.isNotEmpty &&
                      city.text.isNotEmpty &&
                      pinCode.text.isNotEmpty &&
                      state.text.isNotEmpty) {
                    await addressViewModal.addUserAddress(
                        line.text.toString(),
                        locality.text.toString(),
                        city.text.toString(),
                        pinCode.text.toString(),
                        state.text.toString(),
                        context);
                  } else {
                    Get.snackbar("please Fill Your Address..", "",
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
    );
  }
}

// ignore: must_be_immutable
class SingleRadioButton extends StatelessWidget {
  String lable;

  SingleRadioButton(this.lable, {Key? key}) : super(key: key);
  AddressViewModal addressViewModal = Get.put(AddressViewModal());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => RadioListTile(
            title: Text(lable,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            value: lable,
            groupValue: addressViewModal.addressType.value.toString(),
            contentPadding: EdgeInsets.all(0.sm),
            dense: true,
            activeColor: const Color(0xff4CAF50),
            onChanged: (value) {
              addressViewModal.addressType.value = value.toString();
            }),
      ),
    );
  }
}

class TextFild extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final TextEditingController controller;

  const TextFild(this.label, this.inputType, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0x20B3BCCA),
            borderRadius: BorderRadius.circular(6.r)),
        child: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            cursorHeight: 22.h,
            cursorColor: const Color(0xffB3BCCA),
            decoration: InputDecoration(
              hintText: label,
              hintStyle: TextStyle(
                  color: Colors.blueGrey.shade300,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
