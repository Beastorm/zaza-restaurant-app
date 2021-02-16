import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common_components/logo_widget.dart';
import '../../controllers/sign_up_controller.dart';

class SignUpScreenWidget extends StatefulWidget {
  @override
  _SignUpScreenWidgetState createState() => _SignUpScreenWidgetState();
}

class _SignUpScreenWidgetState extends State<SignUpScreenWidget> {
  final SignUpController _signUpController = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  bool hidePassword = true;

  TapGestureRecognizer _moveToSignInScreen(BuildContext context) {
    final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pushNamed(context, "/LogIn");
      };
    return _tapGestureRecognizer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: LogoWidgets(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _signUpController.mobileTextController,
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
                          controller: _signUpController.emailTextController,
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
                        TextFormField(
                          controller: _signUpController.nameTextController,
                          keyboardType: TextInputType.text,
                          //onSaved: (input) => _con.user.name = input,
                          validator: (input) => input.length < 3
                              ? "should_be_more_than_3_chars"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.grey),
                            labelText: "Name",
                            labelStyle:
                                TextStyle(color: Theme.of(context).accentColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: "Enter your Name",
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.person_outline,
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
                          height: 24,
                        ),
                        TextFormField(
                          controller: _signUpController.passwordTextController,
                          obscureText: hidePassword,
                          keyboardType: TextInputType.visiblePassword,
                          //  onSaved: (input) => _con.user.password = input,
                          validator: (input) => input.length < 8
                              ? "should_be_more_than_7_chars"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.grey),
                            labelText: "Password",
                            labelStyle:
                                TextStyle(color: Theme.of(context).accentColor),
                            contentPadding: EdgeInsets.all(12),
                            hintText: '••••••••••••',
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.lock_outline,
                                color: Theme.of(context).accentColor),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context).focusColor,
                              icon: Icon(
                                hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.orange,
                              ),
                            ),
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
                            _signUpController.signUp();
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 140.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            child: Text(
                              "Done",
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
                    // Transform.translate(
                    //   offset: Offset(0, -24),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.orange,
                    //       borderRadius: BorderRadius.all(Radius.circular(100)),
                    //     ),
                    //     child: FlatButton(
                    //       onPressed: () {
                    //         if (_formKey.currentState.validate()) {
                    //           _signUpController.signUp();
                    //         }
                    //       },
                    //       padding: EdgeInsets.symmetric(
                    //           horizontal: 66, vertical: 14),
                    //       color: Colors.orange,
                    //       shape: StadiumBorder(),
                    //       child: Text(
                    //         "Done",
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Transform.translate(
                      offset: Offset(-100, 0),
                      child: SvgPicture.asset("assets/images/waiter.svg"),
                    )
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                RichText(
                  text: TextSpan(
                    text: "Don't have an Account? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: _moveToSignInScreen(context),
                      )
                    ],
                  ),
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
