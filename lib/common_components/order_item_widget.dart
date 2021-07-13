import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/common_components/tag_widget.dart';
import 'package:zaza/controllers/order_controller.dart';
import 'package:zaza/models/order_model.dart';
import 'package:zaza/models/order_status.dart';
import 'package:zaza/screens/product_details/product_details_screen.dart';
import 'package:zaza/screens/track_order_screen/track_order.dart';

import '../contants.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderController _orderController = Get.find<OrderController>();
  OrderItemWidget({
    Key key,
    @required this.item,
  }) : super(key: key);

  final OrderData item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 12.0, right: 12.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TagWidget(
                    index: item.status, list: DeliveryStatus.getList()),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "OrderId: ${item.orderId}",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Divider(),
              Text(
                "Payment Method: ${item.paymentMethod}",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "Total Bill: \$${item.amount}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(height: 16.0),
              LimitedBox(
                maxHeight: 80,
                child: ListView.builder(
                  itemCount: item.productDetails.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    var productItem = item.productDetails[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(ProductDetailsScreenWidget(
                          productItem: productItem,
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: CachedNetworkImage(
                                  imageUrl: productItem.image,
                                  width: 56,
                                  height: 56,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${productItem.name}".capitalize,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Text(
                                    "Qty: ${item.qty.split(",")[index]}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(),
              Visibility(
                visible: item.orderType != "2" &&
                    (item.status != "3" && item.status != "4"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Text("Where is my order?",
                          style: TextStyle(color: Colors.grey)),
                      RaisedButton(
                        color: Colors.transparent,
                        elevation: 0.0,
                        onPressed: () {
                          Get.to(TrackOrderScreen());
                        },
                        child: Text(
                          "Track",
                          style: TextStyle(color: accentColor),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              border: Border.all(color: Colors.grey.shade200)),
        ),
      ),
    );
  }
}
