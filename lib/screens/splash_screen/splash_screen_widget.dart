import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaza/controllers/app_info_controller.dart';

import '../../common_components/logo_widget.dart';
import '../../contants.dart';
import '../../controllers/restaurant_info_controller.dart';
import '../login/login_screen.dart';
import '../pages/pages_screen_widget.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key}) : super(key: key);
  final RestaurantInfoController restaurantInfoController =
      Get.put(RestaurantInfoController());

  final AppInfoController _appInfoController = Get.put(AppInfoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/bacground.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                RestaurantTimingWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: LogoWidgets(),
                ),
                SizedBox(
                  height: 24,
                ),
                FoodPicWidget()
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Opacity(
                    opacity: 0.87,
                    child: Text(
                      '"Nothing is better than going home to family and \neating good food and relaxing."',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ButtonsWidget(),
                  SizedBox(
                    height: 18,
                  ),
                  SvgPicture.asset("assets/images/support.svg"),
                  Obx(() => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Call us: ${_appInfoController.restaurantMobileNo.value}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  BottomInfoWidget(),
                ],
              ),
            ),
            Positioned(
              height: 140,
              width: 36.0,
              right: 0,
              top: 88,
              child: Obx(
                () => Container(
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      restaurantInfoController.isRestaurantOpenStatus.value ==
                              true
                          ? "Open"
                          : "Closed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color:
                        restaurantInfoController.isRestaurantOpenStatus.value ==
                                true
                            ? Colors.green
                            : secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FoodPicWidget extends StatelessWidget {
  const FoodPicWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/item1.svg"),
        SizedBox(
          width: 18,
        ),
        SvgPicture.asset("assets/images/item2.svg"),
        SizedBox(
          width: 18,
        ),
        SvgPicture.asset("assets/images/item3.svg"),
        SizedBox(
          width: 18,
        ),
        SvgPicture.asset("assets/images/item3.svg"),
      ],
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  final pref = GetStorage();

  ButtonsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () {
            Get.to(PagesScreenWidget(
              currentTab: 0,
            ));
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset("assets/images/btn_bg.svg"),
              Text(
                "Home",
                textAlign: TextAlign.center,
              ),
              Positioned(
                left: 4.0,
                top: 0,
                bottom: 0,
                child: Icon(
                  Icons.home_rounded,
                  size: 20,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        !pref.hasData("isLogin")
            ? InkWell(
                onTap: () {
                  Get.to(LoginScreenWidget());
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset("assets/images/sign_in_btn_bg.svg"),
                    Text(
                      "LogIn",
                      textAlign: TextAlign.center,
                    ),
                    Positioned(
                      left: 4.0,
                      top: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.input,
                        size: 20,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class BottomInfoWidget extends StatelessWidget {
  const BottomInfoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Home Delivery and COD are available",
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 18,
              ),
              SvgPicture.asset("assets/images/delivery_guy.svg"),
              Spacer(),
              SvgPicture.asset("assets/images/arrows.svg"),
              Spacer(),
              SvgPicture.asset("assets/images/house.svg"),
              SizedBox(
                width: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// restaurant timing UI
class RestaurantTimingWidget extends StatelessWidget {
  final RestaurantInfoController restaurantInfoController =
      Get.put(RestaurantInfoController());

  RestaurantTimingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/circle_drawable.svg"),
          SizedBox(
            width: 4,
          ),
          Text(
            "Open",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: SvgPicture.asset("assets/images/line_separater.svg"),
          ),
          SizedBox(
            width: 4,
          ),
          SvgPicture.asset("assets/images/ic_access_time_24px.svg"),
          SizedBox(
            width: 4,
          ),
          Text(
            restaurantInfoController.todayOpenTime.value,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 24,
          ),
          SvgPicture.asset(
            "assets/images/circle_drawable.svg",
            color: Colors.black87,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "Close",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: SvgPicture.asset("assets/images/line_separater.svg"),
          ),
          SizedBox(
            width: 4,
          ),
          SvgPicture.asset("assets/images/ic_access_time_24px.svg"),
          SizedBox(
            width: 4,
          ),
          Text(
            restaurantInfoController.todayCloseTime.value,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
