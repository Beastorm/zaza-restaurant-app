import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zaza/repo/login_repo.dart';
import 'package:zaza/screens/pages/pages_screen_widget.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  void login() async {
    print("in login");
    bool status = false;
    String email, pwd;

    email = emailTextController.text;
    pwd = passwordTextController.text;

    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    status = await loginProcess(email, pwd);

    if (status) {
      Get.snackbar("Success", "Login!", snackPosition: SnackPosition.BOTTOM);
      Get.offAll(PagesScreenWidget(
        currentTab: 0,
      ));
      Get.back();
    } else {
      Get.back();
      Get.snackbar("Error", "Something Went Wrong!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();

    super.onClose();
  }
}
