import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/fav_model.dart';
import '../repo/fav_repo.dart';

class FavouriteController extends GetxController {
  var favouriteList = List<Datum>().obs;
  final pref = GetStorage();

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    requestForAllFavList();
    super.onInit();
  }

  requestForAllFavList() async {
    if (pref.hasData("userId")) {
      List<Datum> favList = await getFavList(pref.read("userId"));

      if (favList != null) {
        if (favList.length == 0) {
          return;
        }
        favouriteList.assignAll(favList);
      } else {
        favouriteList.clear();
      }
    }
  }

  addProductFavList(String productId) async {
    print(pref.read("userId"));

    if (pref.hasData("userId")) {
      var status = await addToFav(productId, pref.read<String>("userId"));
      if (status) {
        await requestForAllFavList();
        Get.snackbar("Added In Favourite", "",
            snackPosition: SnackPosition.BOTTOM);
      } else
        Get.snackbar("Error", "", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<bool> delFromFavList(String tableId) async {
    bool status;

    print(pref.read("userId"));

    if (pref.hasData("userId")) {
      status = await delFromFav(tableId);
      if (status) {
        await requestForAllFavList();
        favouriteList.refresh();
        Get.snackbar("Deleted From Favourite", "",
            snackPosition: SnackPosition.BOTTOM);
        status = true;
      } else {
        favouriteList.clear();
        Get.snackbar("Error", "", snackPosition: SnackPosition.BOTTOM);
      }
    }
    return status;
  }
}
