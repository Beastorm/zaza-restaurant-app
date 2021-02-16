import 'package:flutter/material.dart';

import '../../contants.dart';

class EditProfileScreenWidget extends StatefulWidget {
  @override
  _EditProfileScreenWidgetState createState() =>
      _EditProfileScreenWidgetState();
}

class _EditProfileScreenWidgetState extends State<EditProfileScreenWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          // controller: _signUpController.mobileTextController,
                          keyboardType: TextInputType.phone,
                          //onSaved: (input) => _con.user.name = input,
                          validator: (input) =>
                          input.length != 10
                              ? "should_be_equal_to_10_digits"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.grey),
                            labelText: "Mobile",
                            labelStyle:
                            TextStyle(color: Theme
                                .of(context)
                                .accentColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: "Enter your Mobile",
                            hintStyle: TextStyle(
                                color: Theme
                                    .of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.phone,
                                color: Theme
                                    .of(context)
                                    .accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .focusColor
                                        .withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        TextFormField(
                          // controller: _signUpController.emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          //onSaved: (input) => _con.user.name = input,
                          validator: (input) =>
                          !input.contains("@")
                              ? "invalid email Format"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.grey),
                            labelText: "Email",
                            labelStyle:
                            TextStyle(color: Theme
                                .of(context)
                                .accentColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: "Enter your Email",
                            hintStyle: TextStyle(
                                color: Theme
                                    .of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.alternate_email_rounded,
                                color: Theme
                                    .of(context)
                                    .accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .focusColor
                                        .withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                          ),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        TextFormField(
                          //  controller: _signUpController.nameTextController,
                          keyboardType: TextInputType.text,
                          //onSaved: (input) => _con.user.name = input,
                          validator: (input) =>
                          input.length < 3
                              ? "should_be_more_than_3_chars"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.grey),
                            labelText: "Name",
                            labelStyle:
                            TextStyle(color: Theme
                                .of(context)
                                .accentColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: "Enter your Name",
                            hintStyle: TextStyle(
                                color: Theme
                                    .of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.person_outline,
                                color: Theme
                                    .of(context)
                                    .accentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .focusColor
                                        .withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme
                                        .of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                          ),
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
                          if (_formKey.currentState.validate()) {
                            // _signUpController.signUp();
                          }
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
