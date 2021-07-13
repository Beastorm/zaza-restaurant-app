import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zaza/models/order_model.dart';

import 'package:zaza/repo/orders_repo.dart';
import '../helpers/maps_utils.dart';

class OrderController extends GetxController {
  var orderList = List<OrderData>().obs;
  var pref = GetStorage();

  @override
  void onInit() {
    orderList.clear();
    requestForOrderList();
    super.onInit();
  }

  requestForOrderList() async {
    var data = await getOrders(pref.read("userId"));
    if (data != null) {
      if (data.length > 0) {
        orderList.assignAll(data);
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

  //1. make sure that order-type is 1.
  //2. and status is 2.
  //3. then we move to track order screen.

  //4. we need two markers.
  //4.1  one for shipping address of user and second one for delvery boy address
  //4.2  refresh button for current status

  Future<LatLng> geocoding(String shippingAddrerss) async {
    var res = await getLatLng(shippingAddrerss);

    if (res != null) {
      return LatLng(res.lat, res.lng);
    } else
      return null;
  }
}
