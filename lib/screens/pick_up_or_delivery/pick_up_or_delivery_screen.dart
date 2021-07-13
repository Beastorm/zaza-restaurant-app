import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zaza/controllers/restaurant_info_controller.dart';
import 'package:zaza/screens/delivery_address/delivery_screen.dart';
import 'package:zaza/screens/order_and_payment_methods/order_and_payment_methods_screen.dart';

import '../../contants.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/pick_up_or_delivery_controller.dart';

class PickUpOrDeliveryScreenWidget extends StatefulWidget {
  @override
  _PickUpOrDeliveryScreenWidgetState createState() =>
      _PickUpOrDeliveryScreenWidgetState();
}

class _PickUpOrDeliveryScreenWidgetState
    extends State<PickUpOrDeliveryScreenWidget> {
  final CartController controller = Get.find<CartController>();
  final PickUpOrDeliveryController pickUpOrDeliveryController =
      Get.put(PickUpOrDeliveryController());

  final RestaurantInfoController restaurantInfoController =
      Get.put(RestaurantInfoController());

  //final pref = GetStorage();
  final _zipFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => controller.cartList.length != 0
            ? GestureDetector(
                onTap: () {
                  // Get.to(OrderAndPaymentMethodScreenWidget(
                  //   serviceType: "Pick",
                  // ));

                  if (pickUpOrDeliveryController.isPickUpSelected.value)
                    Get.to(OrderAndPaymentMethodScreenWidget(
                      serviceType: "Pick",
                    ));
                  else {
                    if (restaurantInfoController
                            .postalCodeController.text.isNotEmpty &&
                        restaurantInfoController.verifyPostalCode() &&
                        controller.shippingAddress.isNotEmpty) {
                      Get.to(OrderAndPaymentMethodScreenWidget(
                        serviceType: "Delivery",
                      ));
                    } else {
                      Get.snackbar(
                          "Info", "Please select address and verify zipcode");
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 56,
                  color: Colors.greenAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 40.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 16.0),
                          child: Text(
                            "Cart Bill: \$${controller.totalBillOfCart()}",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(200),
                            bottomRight: Radius.circular(200),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.payment,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Obx(
                            () => Text(
                              pickUpOrDeliveryController.bottomTxt.value,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox(),
      ),
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0.0,
        backgroundColor: secondaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Pick Up / Delivery",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 24.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Select your Service type",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        pickUpOrDeliveryController.togglePickSelection(
                            pickUpOrDeliveryController.isPickUpSelected.value);
                      },
                      child: Obx(
                        () => Container(
                          child: pickUpOrDeliveryController
                                      .isPickUpSelected.value ==
                                  true
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : SizedBox(),
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: pickUpOrDeliveryController
                                          .isPickUpSelected.value ==
                                      true
                                  ? accentColor
                                  : Colors.grey,
                            ),
                            color: pickUpOrDeliveryController
                                        .isPickUpSelected.value ==
                                    true
                                ? accentColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/images/ic_pick_up.svg"),
                    title: Text(
                      "Pick Up",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    subtitle: Text(
                      "You can Pick Up your Items from \n\nCecilia Chapma 711-2880 Nulla St.Mankato Mississippi 96522(257) 563-7401",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.4,
                    blurRadius: 0.8,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.0,
          ),

          // deliver type service section////////////////////////
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        pickUpOrDeliveryController.toggleDeliverySelection(
                            pickUpOrDeliveryController
                                .isDeliverySelected.value);
                      },
                      child: Obx(
                        () => Container(
                          child: pickUpOrDeliveryController
                                      .isDeliverySelected.value ==
                                  true
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : SizedBox(),
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: pickUpOrDeliveryController
                                          .isDeliverySelected.value ==
                                      true
                                  ? accentColor
                                  : Colors.grey,
                            ),
                            color: pickUpOrDeliveryController
                                        .isDeliverySelected.value ==
                                    true
                                ? accentColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(24.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/images/ic_delivery.svg"),
                    title: Text(
                      "Delivery",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    subtitle: Text(
                      "We will Deliver your food item(s) at\n\n ${controller.shippingAddress.value}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.4,
                    blurRadius: 0.8,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),

          Obx(
            () => Container(
              child: pickUpOrDeliveryController.isDeliverySelected.value
                  ? Column(
                      children: [
                        Container(
                          color: Colors.grey.withOpacity(.10),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(
                              16.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Shipping Details",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black87),
                                    ),
                                    Spacer(),
                                    RaisedButton(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      onPressed: () async {
                                        var data = await Get.to(
                                            DeliveryScreenWidget());

                                        if (data != null) {
                                          controller.shippingAddress.value =
                                              data.toString();
                                        }
                                      },
                                      child: Text(
                                        "Change",
                                        style: TextStyle(
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                Obx(
                                  () => controller
                                          .shippingAddress.value.isNotEmpty
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.location_pin),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Expanded(
                                              child: Obx(
                                                () => Text(
                                                  controller
                                                      .shippingAddress.value,
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 16.0,
                                            ),
                                            Text(""),
                                          ],
                                        )
                                      : Text("No address selected"),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.phone_android),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Expanded(
                                      child: Obx(
                                        () => Text(
                                          controller.mobileNo.value,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Container(
                          child: ListTile(
                            onTap: () {
                              controller.getCurrentUserAddress();
                            },
                            contentPadding: EdgeInsets.all(24.0),
                            title: Text(
                              "Use My Current Location",
                              style: TextStyle(color: Colors.black54),
                            ),
                            trailing: Icon(
                              Icons.my_location,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Verify your Zip Code that delivery is possible or not.",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                  ),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 160,
                                      child: Form(
                                        key: _zipFormKey,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        child: TextFormField(
                                          controller: restaurantInfoController
                                              .postalCodeController,
                                          keyboardType: TextInputType.number,
                                          validator: (input) => input.length !=
                                                  5
                                              ? "should_be_equal_to_5_digits"
                                              : null,
                                          decoration: InputDecoration(
                                            errorStyle:
                                                TextStyle(color: Colors.grey),
                                            labelText: "Zip Code",
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            contentPadding: EdgeInsets.all(12),
                                            hintText: "Enter your Zip Code",
                                            hintStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .focusColor
                                                    .withOpacity(0.7)),
                                            prefixIcon: Icon(
                                                Icons.location_history_sharp,
                                                color: Colors.black54),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .focusColor
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .focusColor
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .focusColor
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.0,
                                    ),
                                    RaisedButton(
                                      elevation: 0.0,
                                      color: Colors.transparent,
                                      onPressed: () {
                                        if (_zipFormKey.currentState
                                            .validate()) {
                                          restaurantInfoController
                                              .verifyPostalCode();
                                        }
                                      },
                                      child: Text(
                                        "verify",
                                        style: TextStyle(color: secondaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                Obx(
                                  () => Text(
                                    restaurantInfoController.deliverable.value,
                                    style: TextStyle(color: Colors.lightGreen),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        )
                      ],
                    )
                  : SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
