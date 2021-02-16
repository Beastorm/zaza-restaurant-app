import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/screens/account/edit_profile_screen.dart';

import '../../contants.dart';
import '../../controllers/user_account_controller.dart';
import '../delivery_address/add_delivery_screen.dart';

class UserAccountScreenWidget extends StatefulWidget {
  @override
  _UserAccountScreenWidgetState createState() =>
      _UserAccountScreenWidgetState();
}

class _UserAccountScreenWidgetState extends State<UserAccountScreenWidget> {
  //final UserProfileController userProfileController=   UserProfileController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                    onPressed: () {
                      Get.to(EditProfileScreenWidget());
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
                  child: GetBuilder<UserProfileController>(
                      init: UserProfileController(),
                      builder: (controller) {
                        return Container(
                          height: 400,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.data.personal.image.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            controller.data.personal.image,
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: controller.uploadImage,
                                      child: CircleAvatar(
                                        radius: 56,
                                        backgroundColor: Colors.white,
                                        child: controller.isFileSelected.value
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(56.0),
                                                child: Image.file(
                                                  controller.file.value,
                                                  fit: BoxFit.cover,
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
                                    ),
                              SizedBox(
                                height: 24,
                              ),
                              ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 4.0),
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
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
