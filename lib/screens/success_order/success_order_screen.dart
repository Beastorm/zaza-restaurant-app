
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/contants.dart';
import 'package:zaza/screens/pages/pages_screen_widget.dart';

class SuccessOrderWidget extends StatelessWidget {
  const SuccessOrderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.check_circle_sharp,
                  size: 96.0,
                  color: Colors.greenAccent,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Order Suucessfully Done",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Colors.transparent,
                  elevation: 0.0,
                  onPressed: () {
                    Get.offUntil(
                        GetPageRoute(
                            page: () => PagesScreenWidget(
                                  currentTab: 3,
                                )),
                        (route) =>
                            (route as GetPageRoute).routeName == '/Pages');
                  },
                  child: Text(
                    "view Orders",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
