import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/models/products_model.dart';
import 'package:zaza/repo/products_repo.dart';

class ProductDetailsController extends GetxController {
  TextEditingController noteController = TextEditingController();

  var productList = List<ProductItem>().obs;
  var isLoading = true.obs;

  var currentComboProduct = "0".obs;

  getProducts(String id) async {
    productList.clear();
    isLoading(true);
    try {
      var products = await getAllProduct(id);
      if (products != null && products.length > 0) {
        productList.assignAll(products);
      } else
        productList.assignAll(null);
    } finally {
      isLoading(false);
    }
  }
}
