import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../contants.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/restaurant_info_controller.dart';

import '../pick_up_or_delivery/pick_up_or_delivery_screen.dart';
import '../product_details/product_details_screen.dart';

class CartScreenWidget extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  final RestaurantInfoController restaurantInfoController =
      Get.put(RestaurantInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => cartController.cartList.length != 0
            ? GestureDetector(
                onTap: () {
                  Get.to(PickUpOrDeliveryScreenWidget());
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
                            "Cart Bill: \$${cartController.totalBillOfCart()}",
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
                          Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.forward,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4.0,
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    width: 240,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset("assets/images/cart.svg"),
                          ),
                          Text(
                            "Your Cart",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            width: 48,
                            height: 48,
                            child: Obx(
                              () => Text(
                                "${cartController.cartList.length}",
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(200),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
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
                  SizedBox(
                    height: 24.0,
                  ),
                  Obx(
                    () => Container(
                      child: cartController.cartList.length != 0
                          ? LimitedBox(
                              maxHeight: 220,
                              child: GetX<CartController>(
                                builder: (controller) => ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.cartList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsScreenWidget(
                                              productItem: controller
                                                  .cartList[index]
                                                  .productDetails,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 8.0,
                                          top: 8.0,
                                        ),
                                        child: Container(
                                          height: 220,
                                          width: 300,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Expanded(
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height: 140,
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    width: 140,
                                                                    height: 140,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    imageUrl: controller
                                                                        .cartList[
                                                                            index]
                                                                        .productDetails
                                                                        .image,
                                                                    placeholder:
                                                                        (context,
                                                                                url) =>
                                                                            Image.asset(
                                                                      'assets/images/loading.gif',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        Icon(Icons
                                                                            .error),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          12.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        controller
                                                                            .cartList[index]
                                                                            .productDetails
                                                                            .name,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            2,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16.0),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            8.0,
                                                                      ),
                                                                      Text(
                                                                        "\$${controller.calculatePriceOfProductItem(controller.cartList[index].qty, controller.cartList[index].price)}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            8.0,
                                                                      ),
                                                                      Text(
                                                                        "Qty: ${controller.cartList[index].qty}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white
                                                                .withAlpha(210),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      8.0),
                                                            ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.3),
                                                                spreadRadius: 1,
                                                                blurRadius: 2,
                                                                offset: Offset(
                                                                    0,
                                                                    0), // changes position of shadow
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Positioned(
                                                          right: 8,
                                                          bottom: 8,
                                                          child: InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .delFromCartList(
                                                                controller
                                                                    .cartList[
                                                                        index]
                                                                    .id,
                                                              );
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 36,
                                                              height: 36,
                                                              child: Icon(
                                                                Icons
                                                                    .delete_outline_rounded,
                                                                color:
                                                                    secondaryColor,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          200),
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.3),
                                                                    spreadRadius:
                                                                        0.4,
                                                                    blurRadius:
                                                                        0.2,
                                                                    offset: Offset(
                                                                        0,
                                                                        0), // changes position of shadow
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0, left: 10.0),
                                                child: Container(
                                                  height: 56.0,
                                                  width: 300,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child: IconButton(
                                                          icon: Icon(
                                                              Icons.remove),
                                                          onPressed: () {
                                                            // setState(() {
                                                            //   if (snapshot.data[index].counter > 0) {
                                                            //     snapshot.data[index].counter--;
                                                            //   }
                                                            // },);

                                                            cartController
                                                                .decrementQty(
                                                                    index);
                                                            cartController
                                                                .updateUserCart(
                                                              cartController
                                                                  .cartList[
                                                                      index]
                                                                  .id,
                                                              cartController
                                                                  .cartList[
                                                                      index]
                                                                  .qty,
                                                              cartController
                                                                  .cartList[
                                                                      index]
                                                                  .price,
                                                            );
                                                          },
                                                          color: Colors.green,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                200),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.3),
                                                              spreadRadius: 0.4,
                                                              blurRadius: 0.2,
                                                              offset: Offset(0,
                                                                  0), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8.0,
                                                      ),
                                                      Text(
                                                        cartController
                                                            .cartList[index]
                                                            .qty,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 8.0,
                                                      ),
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        child: IconButton(
                                                          icon: Icon(Icons.add),
                                                          color: Colors.green,
                                                          onPressed: () {
                                                            cartController
                                                                .incrementQty(
                                                                    index);

                                                            cartController
                                                                .updateUserCart(
                                                              cartController
                                                                  .cartList[
                                                                      index]
                                                                  .id,
                                                              cartController
                                                                  .cartList[
                                                                      index]
                                                                  .qty,
                                                              cartController
                                                                  .cartList[
                                                                      index]
                                                                  .price,
                                                            );
                                                          },
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                200),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.3),
                                                              spreadRadius: 0.4,
                                                              blurRadius: 0.2,
                                                              offset: Offset(0,
                                                                  0), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withAlpha(210),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(8.0),
                                                      bottomRight:
                                                          Radius.circular(8.0),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        spreadRadius: 1,
                                                        blurRadius: 2,
                                                        offset: Offset(0,
                                                            0), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("No Items in your Cart"),
                              )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
