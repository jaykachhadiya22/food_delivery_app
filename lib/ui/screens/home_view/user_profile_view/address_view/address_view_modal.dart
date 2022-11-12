
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../../data_modal/user_data_modal/get_user_profile_data_modal.dart';
import '../../../../../locator/locator.dart';
import '../../../../../services/api_calling_service/user_api_calling_service/get_user_profile_api_calling_service.dart';
import '../../../../../services/api_calling_service/user_api_calling_service/update_user_profile_service.dart';
import '../../../../../services/get_current_user_services/get_current_user_services.dart';
import '../user_profile_view_modal.dart';

class AddressViewModal extends GetxController {
  var userId = "";
  User? user;
  GetUserData? userData;
  RxBool busiya = false.obs;
  RxString addressType = "Home".obs;
  UpdateUserProfileService updateUserProfileService =
  locator<UpdateUserProfileService>();
  UserProfileViewModal userProfileViewModal = Get.put(UserProfileViewModal());
  GetCurrentUserServices getCurrentUserServices =
  locator<GetCurrentUserServices>();
  GetUserProfileApiCallingService getUserProfileApiCallingService =
  locator<GetUserProfileApiCallingService>();

  @override
  Future<void> onInit() async {
    await getCurrentUserData();
    await getUserProfileData();
    super.onInit();
  }

  getCurrentUserData() async {
    user = await getCurrentUserServices.getCurrentUserData();
    update();
  }

  getUserProfileData() async {
    userData = await getUserProfileApiCallingService.getUserProfile(user!.uid);
    busiya.value = true;
    update();
  }

  addUserAddress(String houseNo, String locality, String city, String pinCode,
      String state, BuildContext context) async {
    EasyLoading.show(status: 'Loading...');
    await updateUserProfileService.addUserAddress(
        user!.uid,
        addressType.value,
        houseNo,
        locality,
        city,
        state,
        pinCode);
    EasyLoading.dismiss();
    busiya.value = false;
    Navigator.pop(context);
    await onInit();
  }

  updateUserAddress(String houseNo, String addId,String locality, String city,
      String pinCode, String state) async {
    EasyLoading.show(status: 'Loading...');
    await updateUserProfileService.updateUserAddress(
        user!.uid,
        addId,
        addressType.value,
        houseNo,
        locality,
        city,
        state,
        pinCode);
    busiya.value = false;
    EasyLoading.dismiss();
    await getUserProfileData();

  }

  deleteUserAddress(String addressId)
  async {
    EasyLoading.show(status: 'Loading...');
   await updateUserProfileService.deleteUserAddress(user!.uid,addressId);
   busiya.value= false;
   EasyLoading.dismiss();
   await getUserProfileData();

  }
}
