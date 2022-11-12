import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../locator/locator.dart';
import '../../../services/auth_service/auth_service.dart';
import '../login_view/login_view.dart';


class ForgotPasswordViewModal extends GetxController {
  RxString email = "".obs;

  AuthService authService = locator<AuthService>();

  forgotPassword() async {
    EasyLoading.show(status: 'Loading...');
    try {
      await authService.resetPassword(email: email.value.trim());
      EasyLoading.dismiss();
      Get.snackbar("Email send your id..", "",
          snackPosition: SnackPosition.BOTTOM);
      Get.off(LoginView());
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        Get.snackbar("No User Found", "", snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      EasyLoading.dismiss();
      Get.snackbar("$error", "", snackPosition: SnackPosition.BOTTOM);
    }
  }

  emailValidation() {
    final bool isValid = EmailValidator.validate(email.value.trim());
    if (isValid) {
      return true;
    } else {
      Get.snackbar("Enter Valid Email...", "",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
