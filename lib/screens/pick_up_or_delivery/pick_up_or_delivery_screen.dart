import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => controller.cartList.length != 0
            ? GestureDetector(
                onTap: () {
                  Get.to(OrderAndPaymentMethodScreenWidget());
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
      body: Column(
        children: [
          SizedBox(
            height: 24.0,
          ),
          Text(
            "Select your Service type",
            style: TextStyle(fontSize: 16.0),
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
        ],
      ),
    );
  }
}
