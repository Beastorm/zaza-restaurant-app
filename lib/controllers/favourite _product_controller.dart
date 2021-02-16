import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaza/models/fav_model.dart';
import 'package:zaza/repo/fav_repo.dart';

class FavouriteController extends GetxController {
  var favouriteList = List<Datum>().obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    getAllFavList();

    super.onInit();
  }

  getAllFavList() async {
    final pref = GetStorage();
    if (pref.hasData("userId")) {
      List<Datum> favList = await getFavList(pref.read("userId"));

      print(" 444444444444444444444444444444444444444444444");
      print(favouriteList.isBlank);
      print(favList);
      print(" 444444444444444444444444444444444444444444444");
      if (favList != null) {
        favouriteList.assignAll(favList);
      } else {
        favouriteList.clear();
        // Get.defaultDialog(
        //   title: "No Data",
        //   barrierDismissible: false,
        //   middleText: "No food item in your favourite List",
        //   radius: 4.0,
        // );
      }
    }
  }

  addProductFavList(String productId) async {
    final pref = GetStorage();
    print(pref.read("userId"));

    if (pref.hasData("userId")) {
      var status = await addToFav(productId, pref.read<String>("userId"));
      if (status) {
        getAllFavList();
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
        getAllFavList();
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
