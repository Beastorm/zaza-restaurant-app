import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/common_components/order_item_widget.dart';

import '../../contants.dart';
import '../../controllers/order_controller.dart';

class OrdersScreenWidget extends StatefulWidget {
  OrdersScreenWidget({Key key}) : super(key: key);

  @override
  _OrdersScreenWidgetState createState() => _OrdersScreenWidgetState();
}

class _OrdersScreenWidgetState extends State<OrdersScreenWidget> {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 56.0),
              child: Container(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "Orders",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Obx(
                          () => Text(
                            orderController.orderList.length.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.transparent,
              elevation: 0.0,
              onPressed: () {
                orderController.onInit();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Refresh",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: accentColor, fontSize: 14.0),
                ),
              ),
            ),
            GetX<OrderController>(builder: (controller) {
              return controller.orderList.length != 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.orderList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = controller.orderList[index];
                          return OrderItemWidget(item: item);
                        },
                      ),
                    )
                  : Align(
                      child: Text(
                        "No Order Item",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
            }),
            SizedBox(
              height: 56.0,
            )
          ],
        ),
      ),
    );
  }
}
