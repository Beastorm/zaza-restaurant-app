import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_account_model.dart';
import '../repo/user_account_rep.dart';

class UserProfileController extends GetxController {
  UserData data;
  var address = List<Address>().obs;
  var file = File("").obs;
  var isFileSelected = false.obs;

  TextEditingController firstLineController,
      secondLineController,
      pinController;

  @override
  void onInit() {
    getUserAccount();
    firstLineController = TextEditingController();
    secondLineController = TextEditingController();
    pinController = TextEditingController();

    super.onInit();
  }

  getUserAccount() async {
    final pref = GetStorage();
    if (pref.hasData("isLogin")) {
      data = await getUserInfo(pref.read("userId"));
      address.assignAll(data.address);
      print(data.address);
      update();
    }
  }

  delAddress(String tableId) async {
    await deleteUserAddress(tableId);
    getUserAccount();
    Get.snackbar("Deleted!", "", snackPosition: SnackPosition.BOTTOM);
  }

  saveUserAddress() async {
    print("....................");

    final pref = GetStorage();
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    await savedUserAddress(
        pref.read("userId"),
        firstLineController.text + ", " + secondLineController.text,
        pinController.text);
    Get.back();
    Get.snackbar("Saved!", "", snackPosition: SnackPosition.BOTTOM);
  }

  void requestForImageUpload() async {
    final picker = ImagePicker();
    File _imageFile;
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    _imageFile = File(pickedFile.path);
    file.value = _imageFile;
    isFileSelected(true);
    editUserImage(file.value);
    update();
  }

  addValueToForm(String add1, String zip) {
    firstLineController.text = add1;
    pinController.text = zip;
  }
}
