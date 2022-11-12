import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../../data_modal/user_data_modal/get_user_profile_data_modal.dart';
import '../../../../locator/locator.dart';
import '../../../../services/api_calling_service/user_api_calling_service/get_user_profile_api_calling_service.dart';

class UserProfileViewModal extends GetxController {
  var userId = "";
  RxBool busiya = false.obs;

  GetUserProfileApiCallingService getUserProfileApiCallingService =
      locator<GetUserProfileApiCallingService>();
  GetUserData? userData;

  @override
  Future<void> onInit() async {
    getUserProfileData();
    super.onInit();
  }

  singOut() async {
    var storage = const FlutterSecureStorage();
    FirebaseAuth.instance.signOut();
    await storage.delete(key: "uid");
    print("ok");
  }

  getUserProfileData() async {
    const storage = FlutterSecureStorage();
    userId = (await storage.read(key: "uid"))!;
    userData = await getUserProfileApiCallingService.getUserProfile(userId);
    busiya.value = true;
  }
}
