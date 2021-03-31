import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaza/models/products_model.dart';
import 'package:zaza/repo/orders_repo.dart';

class OrderController extends GetxController {
  var orderList = List<ProductItem>().obs;

  @override
  void onInit() {
    requestForOrderList();
    super.onInit();
  }

  requestForOrderList() async {
    List<ProductItem> list = List<ProductItem>();
    var pref = GetStorage();
    var data = await getOrders(pref.read("userId"));
    if (data != null) {
      if (data.length > 0) {
        for (var item in data) {
          list.addAll(item.product);
        }
        orderList.assignAll(list);
      } else {
        Get.defaultDialog(
          title: "Empty",
          barrierDismissible: true,
          middleText: "No Oder items",
          radius: 4.0,
        );
      }
    }
  }
}
