import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaza/helpers/maps_utils.dart';
import 'package:zaza/models/cart_model.dart';
import 'package:zaza/models/user_account_model.dart';
import 'package:zaza/repo/cart_repo.dart';
import 'package:zaza/repo/user_account_rep.dart';

class CartController extends GetxController {
  var cartList = List<Datum>().obs;
  TextEditingController zipController;
  var shippingAddress = "".obs;
  var isCurrentAddressUsed = false.obs;
  var mobileNo = "".obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    gettingUserSavedAddress();
    gettingUserInfo();
    getAllCartItem();
    zipController = TextEditingController();

    super.onInit();
  }

  getAllCartItem() async {
    final pref = GetStorage();
    if (pref.hasData("userId")) {
      List<Datum> cartProducts = await getCartList(pref.read("userId"));

      print(" cartcartcartcartcartcartcartcartcartcartcartcart");

      print(cartProducts);
      print(" cartcartcartcartcartcartcartcartcartcartcartcart");
      if (cartProducts != null) {
        cartList.assignAll(cartProducts);
      } else {
        cartList.clear();
        // Get.defaultDialog(
        //   title: "No Data",
        //   barrierDismissible: true,
        //   middleText: "No food item in your Cart List",
        //   radius: 4.0,
        // );
      }
    }
  }

  addProductInCartList(String productId, String qty, String cost) async {
    final pref = GetStorage();
    print(pref.read("userId"));

    if (pref.hasData("userId")) {
      var status =
          await addToCart(productId, pref.read<String>("userId"), qty, cost);
      if (status) {
        getAllCartItem();
        Get.snackbar("Added In Cart", "", snackPosition: SnackPosition.BOTTOM);
      } else
        Get.snackbar("Error", "", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<bool> delFromCartList(String tableId) async {
    bool status = false;
    final pref = GetStorage();
    print(pref.read("userId"));

    if (pref.hasData("userId")) {
      var status = await delFromCart(tableId);
      if (status) {
        getAllCartItem();
        cartList.refresh();
        Get.snackbar("Deleted From Cart", "",
            snackPosition: SnackPosition.BOTTOM);
        status = true;
      } else
        Get.snackbar("Error", "", snackPosition: SnackPosition.BOTTOM);
    }
    return status;
  }

  updateUserCart(String tableId, String qty, String dicountedPriceOfItem) {
    print("..................update....................");
    updateCart(tableId, qty, dicountedPriceOfItem);
  }

// calculation discounted price with discount
  String getFoodCost(String price, String discount) {
    double pric, disc;

    pric = double.parse(price);
    disc = double.parse(discount);

    if (disc > 0) {
      return (pric - (disc / 100) * pric).toString();
    } else
      return price;
  }

// maximum allowed value for qty of product is 99 and min  is 1

  incrementQty(int index) {
    print("..................incremnet....................");
    print(cartList.elementAt(index).qty);
    String quantity = (int.parse(cartList.elementAt(index).qty)) < 100
        ? ((int.parse(cartList.elementAt(index).qty) + 1).toString())
        : "1";

    cartList.elementAt(index).qty = quantity;
    cartList.refresh();
  }

  decrementQty(int index) {
    String quantity = (int.parse(cartList.elementAt(index).qty)) > 1
        ? ((int.parse(cartList.elementAt(index).qty) - 1).toString())
        : "1";
    cartList.elementAt(index).qty = quantity;

    cartList.refresh();
  }

// total cart bill including quantity
  String totalBillOfCart() {
    return cartList
        .fold(
            0,
            (previousValue, element) =>
                previousValue +
                double.parse(element.price) * double.parse(element.qty))
        .toStringAsFixed(2);
  }

// calculating price of each food item by qty
  String calculatePriceOfProductItem(String qty, String dicountedPrice) {
    return (int.parse(qty) * double.parse(dicountedPrice)).toStringAsFixed(2);
  }

//FROM GOOGLE MAP API
  getCurrentUserAddress() async {
    var address = await getUserCurrentAddress();
    if (address != null) {
      shippingAddress.value = address.toString();
      isCurrentAddressUsed.value = true;

      print(shippingAddress.value);
      await saveUserAddress();
    }
  }

//SAVING CURRENT USER ADDRESS FROM GOOGLE MAP API
  saveUserAddress() async {
    print("sahgsdhghgdsh....................");
    final pref = GetStorage();

    await savedUserAddress(pref.read("userId"), shippingAddress.value,
        getPostalCode(shippingAddress.value));
  }

//GETING ADDRESS FROM SERVER, SETTING FIRST ADDRESS
  gettingUserSavedAddress() async {
    final pref = GetStorage();
    UserData userData = await getUserInfo(pref.read("userId"));
    if (userData != null) {
      shippingAddress.value = userData.address[0].address;
    }
  }

  gettingUserInfo() async {
    UserData data;
    final pref = GetStorage();
    if (pref.hasData("isLogin")) {
      data = await getUserInfo(pref.read("userId"));
      mobileNo.value = data.personal.mobile;
      update();
    }
  }
}
