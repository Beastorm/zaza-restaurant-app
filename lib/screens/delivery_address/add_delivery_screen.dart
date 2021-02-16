import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/contants.dart';
import 'package:zaza/controllers/user_account_controller.dart';

class AddDeliveryScreenWidget extends StatelessWidget {
  final UserProfileController userProfileController =
      Get.put(UserProfileController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Add address",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListView(
            children: [
              Container(
                child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100.0,
                          ),
                          TextFormField(
                            controller:
                                userProfileController.firstLineController,
                            keyboardType: TextInputType.streetAddress,
                            //onSaved: (input) => _con.user.name = input,
                            validator: (input) =>
                                input.length < 1 ? "should_be_not_empty" : null,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.grey),
                              labelText: "First line",
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              contentPadding: EdgeInsets.all(12),
                              hintText: "building no, street no",
                              hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.7)),
                              prefixIcon: Icon(Icons.looks_one,
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
                                userProfileController.secondLineController,
                            keyboardType: TextInputType.streetAddress,
                            //onSaved: (input) => _con.user.name = input,
                            validator: (input) =>
                                input.length < 1 ? "should_be_not_empty" : null,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.grey),
                              labelText: "Second line",
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              contentPadding: EdgeInsets.all(12),
                              hintText: "locality, district, state etc",
                              hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.7)),
                              prefixIcon: Icon(Icons.looks_two,
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
                            controller: userProfileController.pinController,
                            keyboardType: TextInputType.number,
                            //onSaved: (input) => _con.user.name = input,
                            validator: (input) => input.length != 5
                                ? "should_be_equal_to_5_digits"
                                : null,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.grey),
                              labelText: "Postal code",
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              contentPadding: EdgeInsets.all(12),
                              hintText: "enter postal code",
                              hintStyle: TextStyle(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.7)),
                              prefixIcon: Icon(Icons.contact_mail,
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
                            height: 48.0,
                          ),
                          RaisedButton.icon(
                              color: secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  userProfileController.saveUserAddress();
                                }
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              label: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 10.0),
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
