import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../repo/user_account_rep.dart';

class EditProfileController extends GetxController {
  final pref = GetStorage();
  var isAnyChangesInUserInfo = false.obs;
  var isVegOrNonVegSelected = false.obs;

  TextEditingController nameEditingController,
      emailEditingController,
      mobileEditingController;

  @override
  void onInit() {
    emailEditingController = TextEditingController();
    mobileEditingController = TextEditingController();
    emailEditingController.text = pref.read("email");
    mobileEditingController.text = pref.read("mobile");

    isVegOrNonVegSelected.value = pref.read("veg") == "0" ? false : true;
    print(isVegOrNonVegSelected.value);
    super.onInit();
  }

  saveUserData() async {
    if (pref.hasData("isLogin")) {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      await updateUserInfo(
          pref.read("userId"),
          emailEditingController.text,
          mobileEditingController.text,
          isVegOrNonVegSelected.value ? "1" : "0");


      pref.write("email", emailEditingController.text);
      pref.write("mobile", mobileEditingController.text);
      pref.write("veg", isVegOrNonVegSelected.value ? "1" : "0");
      Get.back();
      Get.back(result: true);
      Get.snackbar("Saved", "Successfully!",
          snackPosition: SnackPosition.BOTTOM);
      update();
    }
  }

  checkForChangesInUserInfo() {
    if (emailEditingController.text == pref.read("email") &&
        mobileEditingController.text == pref.read("mobile")) {
      isAnyChangesInUserInfo(false);
      return false;
    }
    isAnyChangesInUserInfo(true);
    return true;
  }

  toggleVegOrNonVegType(bool type) {
    isVegOrNonVegSelected.value = !type;
    isAnyChangesInUserInfo(true);
  }
}
