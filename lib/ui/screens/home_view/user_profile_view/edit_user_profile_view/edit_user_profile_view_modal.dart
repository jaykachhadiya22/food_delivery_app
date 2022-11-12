import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_hotel_project/services/firebase_storage_services/firebase_storage_services.dart';
import '../../../../../locator/locator.dart';
import '../../../../../services/api_calling_service/user_api_calling_service/update_user_profile_service.dart';
import '../../../../../services/get_current_user_services/get_current_user_services.dart';

class EditUserProfileViewModal extends GetxController {
  final ImagePicker picker = ImagePicker();
  RxString imagePath = "".obs; //image store
  File? profilImage;
  String? downlodeUrl;
  User? user;
  FirebaseStorageServices firebaseStorageServices =
      locator<FirebaseStorageServices>();

  UpdateUserProfileService updateUserProfileService =
      locator<UpdateUserProfileService>();

  GetCurrentUserServices getCurrentUserServices =
      locator<GetCurrentUserServices>();

  @override
  Future<void> onInit() async {

    await getCurrentUserData();
    super.onInit();
  }

  Future pickImageCameraAndGallery(ImageSource source) async {
    try {
      XFile? photo = await picker.pickImage(source: source);
      if (photo != null) {
        imagePath.value = photo.path;
        File file = File(photo.path);
        profilImage = file;
      }
    } on PlatformException catch (e) {
      print("Failed to pick image$e");
    }
    update();
  }

  changeProfileImage()
  async {
    EasyLoading.show(status: 'Loading...');
    downlodeUrl = await firebaseStorageServices.uploadImage(profilImage!);
    update();
    EasyLoading.dismiss();

  }

  getCurrentUserData() async {
    user = await getCurrentUserServices.getCurrentUserData();
    update();
  }

  userUpdateProfile(String name, String phoneNumber) async {
    EasyLoading.show(status: 'Loading...');
    final email = user?.email;
    await updateUserProfileService.updateUserProfile(
        user!.uid, name, email!, int.parse(phoneNumber), downlodeUrl!);
    EasyLoading.dismiss();
  }

}
