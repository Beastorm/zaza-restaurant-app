import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../common_components/logo_widget.dart';
import '../../contants.dart';
import '../../controllers/login_controller.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreenWidget extends StatefulWidget {
  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  bool hidePassword = true;
  final _loginFormKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

  TapGestureRecognizer _moveToSignInScreen(BuildContext context) {
    final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.to(SignUpScreenWidget());
      };
    return _tapGestureRecognizer;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: LogoWidgets(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: loginController.emailTextController,
                            keyboardType: TextInputType.emailAddress,
                            //onSaved: (input) => _con.user.name = input,
                            validator: (input) => !input.contains("@")
                                ? "invalid_email_format"
                                : null,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.grey),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
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
                            controller: loginController.passwordTextController,
                            obscureText: hidePassword,
                            //  onSaved: (input) => _con.user.password = input,
                            validator: (input) =>
                                input.length < 1 ? "should_not_be_empty" : null,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.grey),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
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
                                  color: accentColor,
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
                          SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.orange),
                              )
                            ],
                          )
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
                            if (_loginFormKey.currentState.validate()) {
                              loginController.login();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 140.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12.0),
                              child: Text(
                                "login",
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
                      text: "Already have an Account? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "SignUp",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: _moveToSignInScreen(context),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
