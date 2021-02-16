import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repo/sign_up_repo.dart';

class SignUpController extends GetxController {
  TextEditingController mobileTextController;
  TextEditingController nameTextController;
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  @override
  void onInit() {
    mobileTextController = TextEditingController();
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  void signUp() async {
    bool status = false;
    String mobile, name, email, pwd;
    mobile = mobileTextController.text;
    name = nameTextController.text;
    email = emailTextController.text;
    pwd = passwordTextController.text;

    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    status = await signUpProcess(mobile, email, name, pwd);

    if (status) {
      Get.snackbar("Success", "Registered!",

          snackPosition: SnackPosition.BOTTOM);
      Get.back();
      Get.offNamed('/Login');
    } else {
      Get.snackbar("Error", "Something Went Wrong!",
          snackPosition: SnackPosition.BOTTOM);
      Get.back();
    }
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    nameTextController?.dispose();
    mobileTextController?.dispose();
    super.onClose();
  }
}
