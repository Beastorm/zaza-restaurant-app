import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';
import '../repo/search_repo.dart';

class SearchController extends GetxController {
  var searchResultList = List<ProductItem>().obs;
  TextEditingController textEditingController;

  @override
  void onInit() {
    textEditingController = TextEditingController();
    super.onInit();
  }

  requestForSearch() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var results = await searchProduct(textEditingController.text);
    searchResultList.assignAll(results);
    Get.back();
    update();
  }
}
