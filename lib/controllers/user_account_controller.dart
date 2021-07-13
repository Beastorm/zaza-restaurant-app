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
  var vegOrNonVeg = "0".obs;
  var userPicUrl = "".obs;

  TextEditingController firstLineController,
      secondLineController,
      pinController;
  @override
  void onInit() {
    requestForUserAccount();
    firstLineController = TextEditingController();
    secondLineController = TextEditingController();
    pinController = TextEditingController();
    super.onInit();
  }

  requestForUserAccount() async {
    final pref = GetStorage();
    if (pref.hasData("isLogin")) {
      data = await getUserInfo(pref.read("userId"));
      userPicUrl.value = data.personal.image;
      // saving data to storage
      pref.write("email", data.personal.email);
      pref.write("mobile", data.personal.mobile);
      pref.write("veg", data.personal.type);
      // saved................//
      vegOrNonVeg.value = data.personal.type;
      address.assignAll(data.address);
      print(data.address);
      update();
    }
  }

  delAddress(String tableId) async {
    await deleteUserAddress(tableId);
    requestForUserAccount();
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
    final pref = GetStorage();
    final picker = ImagePicker();
    File _imageFile;
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    _imageFile = File(pickedFile.path);
    file.value = _imageFile;
    isFileSelected(true);
    editUserImage(file.value, pref.read("userId"));
    await requestForUserAccount();
    update();
  }

  addValueToForm(String add1, String zip) {
    firstLineController.text = add1;
    pinController.text = zip;
  }
}
