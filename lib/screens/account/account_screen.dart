import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contants.dart';
import '../../controllers/user_account_controller.dart';
import '../delivery_address/add_delivery_screen.dart';
import 'edit_profile_screen.dart';

class UserAccountScreenWidget extends StatefulWidget {
  @override
  _UserAccountScreenWidgetState createState() =>
      _UserAccountScreenWidgetState();
}

class _UserAccountScreenWidgetState extends State<UserAccountScreenWidget> {
  final UserProfileController controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Container(
                    width: 230,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Text(
                            "My Account",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54, fontSize: 18.0),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.account_circle,
                                color: accentColor,
                                size: 48,
                              ),
                            ),
                          )
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
                  Spacer(),
                  RaisedButton(
                    elevation: 0,
                    color: Colors.transparent,
                    onPressed: () async {
                      bool data = await Get.to(EditProfileScreenWidget());
                      if (data != null) {
                        controller.requestForUserAccount();
                      }
                    },
                    child: Text(
                      "edit",
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                ],
              ),
              SizedBox(height: 48),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: GetX<UserProfileController>(
                    builder: (controller) {
                      return Container(
                        height: 400,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.data.personal.image.isNotEmpty
                                ? ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(100)),
                              child: Stack(
                                children: [
                                  Obx(
                                        () =>
                                        PhysicalModel(
                                          color: Colors.grey,
                                          elevation: 8,
                                          shadowColor: Colors.grey,
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          child: CachedNetworkImage(
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                            imageUrl:
                                            controller.userPicUrl.value,
                                            placeholder: (context, url) =>
                                                Image.asset(
                                                  'assets/images/loading.gif',
                                                  fit: BoxFit.cover,
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                  ),
                                  Positioned(
                                    bottom: -8.0,
                                    right: 0.0,
                                    left: 0.0,
                                    child: RaisedButton(
                                      elevation: 0.0,
                                      color: Colors.black54,
                                      onPressed: controller
                                          .requestForImageUpload,
                                      child: Text(
                                        "change",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                                : GestureDetector(
                              onTap: controller.requestForImageUpload,
                              child: controller.isFileSelected.value
                                  ? ClipRRect(
                                borderRadius:
                                BorderRadius.circular(100),
                                child: Image.file(
                                  controller.file.value,
                                  fit: BoxFit.cover,
                                  width: 72,
                                  height: 72,
                                ),
                              )
                                  : Transform.scale(
                                scale: 4.0,
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),

                            // is user vegetarian or non-vegetarian
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 8.0,
                                        backgroundColor:
                                        controller.vegOrNonVeg.value == "0"
                                            ? Colors.green
                                            : Colors.red,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  Text(
                                      controller.vegOrNonVeg.value == "0"
                                          ? "I'm Vegetarian"
                                          : "I'm Non-Vegetarian",
                                      style: TextStyle(color: Colors.black45))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 4.0),
                              leading: Icon(
                                Icons.person,
                                color: secondaryColor,
                              ),
                              title: Transform.translate(
                                  offset: Offset(-16, 0),
                                  child: Text(
                                    controller.data.personal.name,
                                    style: TextStyle(color: Colors.black45),
                                  )),
                            ),
                            Transform.translate(
                              offset: Offset(0, -24),
                              child: ListTile(
                                contentPadding:
                                const EdgeInsets.only(left: 4.0),
                                leading: Icon(
                                  Icons.mail,
                                  color: secondaryColor,
                                ),
                                title: Transform.translate(
                                    offset: Offset(-16, 0),
                                    child: Text(
                                      controller.data.personal.email,
                                      style: TextStyle(color: Colors.black45),
                                    )),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, -48),
                              child: ListTile(
                                  contentPadding:
                                  const EdgeInsets.only(left: 4.0),
                                  leading: Icon(
                                    Icons.phone_android,
                                    color: secondaryColor,
                                  ),
                                  title: Transform.translate(
                                    offset: Offset(-16, 0),
                                    child: Text(
                                      controller.data.personal.mobile,
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Divider(
                                color: secondaryColor.withOpacity(0.3),
                                thickness: 1,
                              ),
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black87,
                                  ),
                                ),
                                Spacer(),
                                RaisedButton(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  onPressed: () {
                                    Get.to(AddDeliveryScreenWidget());
                                  },
                                  child: Text(
                                    "add",
                                    style: TextStyle(color: secondaryColor),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            controller.address.isEmpty
                                ? Text("No Address saved",
                                style: TextStyle(color: Colors.grey))
                                : Text(controller.address[0].address,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
