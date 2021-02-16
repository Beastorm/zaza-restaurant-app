import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/contants.dart';

class NotLoginScreenWidget extends StatelessWidget {
  const NotLoginScreenWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Not Login, Please Login to access this feature",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              shape: StadiumBorder(),
              color: secondaryColor,
              onPressed: () {
                Get.offAllNamed("/Login");
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
