import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/postal_code_model.dart';
import '../models/restaurant_timing_model.dart';
import '../repo/restaurant_info_repo.dart';

class RestaurantInfoController extends GetxController {
  var postalCodes = List<Datum>().obs;
  var isVerified = false.obs;
  TextEditingController postalCodeController;
  var deliverable = "".obs;
  var timingList = List<TimingData>().obs;

  var todayOpenTime = "".obs;
  var todayCloseTime = "".obs;
  var isRestaurantOpenStatus = false.obs;

  Map<int, String> dayData = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday"
  };

  @override
  void onInit() {
    requestForPostalCode();
    requestForRestaurantInfo();
    // getRestaurantOpeningTime();
    // getRestaurantClosingTime();
    postalCodeController = TextEditingController();
    super.onInit();
  }

  requestForPostalCode() async {
    var codes = await getAllPinCodes();
    if (codes.isNotEmpty && codes != null) {
      postalCodes.assignAll(codes);
      update();
    }
  }

  bool verifyPostalCode() {
    Datum code = postalCodes.firstWhere(
        (element) => element.name == postalCodeController.text,
        orElse: () => null);

    if (code != null) {
      isVerified(true);
      deliverable.value = "Deliverable at this Postal Code";
      update();
      return true;
    } else {
      deliverable.value = "Sorry! No Delivery available in your Area";
      update();
      return false;
    }
  }

  requestForRestaurantInfo() async {
    var info = await getRestaurantInfo();
    timingList.assignAll(info);

    getRestaurantOpeningTime();
    getRestaurantClosingTime();
    isRestaurantOpen();
  }

  // fetching today date time from list of restaurant timing
  TimingData restaurantTodayTiming() {
    var todayDate = DateTime.now();
    int currentDay = todayDate.weekday;
    return timingList
        .firstWhere((element) => element.day == dayData[currentDay]);
  }

  String getRestaurantOpeningTime() {
    TimingData time = restaurantTodayTiming();

    todayOpenTime.value =
        "${time.open.substring(0, 5)}${checkForAmOrPmOfRestaurant(time.open.substring(0, 5))}";
    // print(todayOpenTime.value);
    return time.open.substring(0, 5);
  }

  String getRestaurantClosingTime() {
    TimingData time = restaurantTodayTiming();
    todayCloseTime.value =
        "${time.close.substring(0, 5)}${checkForAmOrPmOfRestaurant(time.close.substring(0, 5))}";

    // print(todayCloseTime.value);
    return time.close.substring(0, 5);
  }

  isRestaurantOpen() {
    var list = DateTime.now()..toString();

    print(list);
    var hr = list.hour.toString();
    var min = list.minute;
    var time = '$hr.$min';

    print(hr);
    print(min);

    var today = double.parse(time);

    print(today);

    var resOpenTime = convertStringToDouble(getRestaurantOpeningTime());
    var resCloseTime = convertStringToDouble(getRestaurantClosingTime());

    print("Today restaurant opening time ${resOpenTime}");
    print("Today restaurant closing time ${resCloseTime}");
    // print()

    if (resOpenTime <= today && today <= resCloseTime) {
      isRestaurantOpenStatus(true);
    } else {
      isRestaurantOpenStatus(false);
    }

    print("Restaurant is open" + isRestaurantOpenStatus.value.toString());
  }

  String checkForAmOrPmOfRestaurant(String time) {
    List<String> parts;
    parts = time.split(":");
    double.parse(parts.join("."));

    if (double.parse(parts.join(".")) > 12.0) {
      return " pm";
    } else {
      return " am";
    }
  }

  double convertStringToDouble(String time) {
    List<String> parts;
    parts = time.split(":");
    return double.parse(parts.join("."));
  }
}
