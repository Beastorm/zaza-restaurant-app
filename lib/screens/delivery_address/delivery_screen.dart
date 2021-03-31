import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contants.dart';
import '../../controllers/user_account_controller.dart';
import 'add_delivery_screen.dart';
import 'edit_delivery_screen.dart';

class DeliveryScreenWidget extends StatelessWidget {
  final UserProfileController userProfileController =
      Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Text(
            "Address List",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          ),
          backgroundColor: secondaryColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: secondaryColor,
          child: Icon(
            Icons.add_location,
            color: Colors.white,
          ),
          mini: true,
          onPressed: () {
            Get.to(AddDeliveryScreenWidget());
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
                child: GetX<UserProfileController>(
              builder: (controller) => ListView.builder(
                itemCount: controller.address.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.back(result: controller.address[index].address);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                controller.address[index].address,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: secondaryColor,
                                    ),
                                    onPressed: () {
                                      Get.to(EditDeliveryScreenWidget(
                                        address: controller.address[index],
                                      ));
                                    }),
                                IconButton(
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: secondaryColor,
                                    ),
                                    onPressed: () {
                                      controller.delAddress(
                                          controller.address[index].id);
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(210),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
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
                ),
              ),
            )),
          ),
        ));
  }
}
