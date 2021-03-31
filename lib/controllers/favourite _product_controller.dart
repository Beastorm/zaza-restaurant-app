import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/fav_model.dart';
import '../repo/fav_repo.dart';

class FavouriteController extends GetxController {
  var favouriteList = List<Datum>().obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    requestForAllFavList();
    super.onInit();
  }

  requestForAllFavList() async {
    final pref = GetStorage();
    if (pref.hasData("userId")) {
      List<Datum> favList = await getFavList(pref.read("userId"));
      print(".........");
      print(favouriteList?.length);
      print(favouriteList);
      print(".........");
      if (favList != null) {
        favouriteList.assignAll(favList);
      } else if (favList.length == 0) {
        favouriteList.clear();
        Get.defaultDialog(
          title: "Empty",
          barrierDismissible: true,
          middleText: "No food item in your favourite List",
          radius: 4.0,
        );
      }
    }
  }

  addProductFavList(String productId) async {
    final pref = GetStorage();
    print(pref.read("userId"));

    if (pref.hasData("userId")) {
      var status = await addToFav(productId, pref.read<String>("userId"));
      if (status) {
        requestForAllFavList();
        Get.snackbar("Added In Favourite", "",
            snackPosition: SnackPosition.BOTTOM);
      } else
        Get.snackbar("Error", "", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<bool> delFromFavList(String tableId) async {
    bool status = false;
    final pref = GetStorage();
    print(pref.read("userId"));

    if (pref.hasData("userId")) {
      var status = await delFromFav(tableId);
      if (status) {
        requestForAllFavList();
        favouriteList.refresh();
        Get.snackbar("Deleted From Favourite", "",
            snackPosition: SnackPosition.BOTTOM);
        status = true;
      } else
        Get.snackbar("Error", "", snackPosition: SnackPosition.BOTTOM);
    }
    return status;
  }
}
