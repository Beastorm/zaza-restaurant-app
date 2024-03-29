import 'package:get/get.dart';
import 'package:zaza/models/products_model.dart';
import 'package:zaza/repo/products_repo.dart';

class ProductController extends GetxController {
  var productList = List<ProductItem>().obs;
  var isLoading = true.obs;


  void getProducts(String id) async {
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
