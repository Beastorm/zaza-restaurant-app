import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contants.dart';
import '../../controllers/edit_profile_controller.dart';

class EditProfileScreenWidget extends StatefulWidget {
  @override
  _EditProfileScreenWidgetState createState() =>
      _EditProfileScreenWidgetState();
}

class _EditProfileScreenWidgetState extends State<EditProfileScreenWidget> {
  final _formKey = GlobalKey<FormState>();
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: secondaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        GestureDetector(
                          onTap: () {
                            _editProfileController.toggleVegOrNonVegType(
                                _editProfileController
                                    .isVegOrNonVegSelected.value);
                          },
                          child: Obx(
                            () => Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      child: _editProfileController
                                                  .isVegOrNonVegSelected
                                                  .value ==
                                              false
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
                                          color: _editProfileController
                                                      .isVegOrNonVegSelected
                                                      .value ==
                                                  true
                                              ? accentColor
                                              : Colors.grey,
                                        ),
                                        color: _editProfileController
                                                    .isVegOrNonVegSelected
                                                    .value ==
                                                false
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
                                            offset: Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18.0,
                                    ),
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
                                        CircleAvatar(
                                            radius: 8.0,
                                            backgroundColor: Colors.green)
                                      ],
                                    ),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Text("I'm Vegetarian",
                                        style: TextStyle(color: Colors.black45))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            _editProfileController.toggleVegOrNonVegType(
                                _editProfileController
                                    .isVegOrNonVegSelected.value);
                          },
                          child: Obx(
                            () => Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      child: _editProfileController
                                                  .isVegOrNonVegSelected
                                                  .value ==
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
                                          color: _editProfileController
                                                      .isVegOrNonVegSelected
                                                      .value ==
                                                  true
                                              ? accentColor
                                              : Colors.grey,
                                        ),
                                        color: _editProfileController
                                                    .isVegOrNonVegSelected
                                                    .value ==
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
                                            offset: Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18.0,
                                    ),
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
                                        CircleAvatar(
                                            radius: 8.0,
                                            backgroundColor: Colors.red)
                                      ],
                                    ),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Text("I'm Non-Vegetarian",
                                        style: TextStyle(color: Colors.black45))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          controller:
                              _editProfileController.mobileEditingController,
                          keyboardType: TextInputType.phone,
                          //onSaved: (input) => _con.user.name = input,
                          validator: (input) => input.length != 10
                              ? "should_be_equal_to_10_digits"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.grey),
                            labelText: "Mobile",
                            labelStyle:
                                TextStyle(color: Theme.of(context).accentColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: "Enter your Mobile",
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.phone,
                                color: Theme.of(context).accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        TextFormField(
                          controller:
                              _editProfileController.emailEditingController,
                          keyboardType: TextInputType.emailAddress,
                          //onSaved: (input) => _con.user.name = input,
                          validator: (input) => !input.contains("@")
                              ? "invalid email Format"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.grey),
                            labelText: "Email",
                            labelStyle:
                                TextStyle(color: Theme.of(context).accentColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: "Enter your Email",
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.alternate_email_rounded,
                                color: Theme.of(context).accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        SizedBox(
                          height: 90,
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(0, -24),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate() &&
                              _editProfileController
                                      .isAnyChangesInUserInfo.value ==
                                  true) {
                            _editProfileController.saveUserData();
                          } else
                            Get.snackbar(
                              "Nothing Change Or UnFormatted Data",
                              "",
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.black,
                              colorText: Colors.white,
                            );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 140.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
