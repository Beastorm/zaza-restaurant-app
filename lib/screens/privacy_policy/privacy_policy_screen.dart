import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/controllers/app_info_controller.dart';

import '../../contants.dart';

class PrivacyPolicyScreenWidget extends StatelessWidget {
  final AppInfoController _appInfoController = Get.put(AppInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0.0,
        backgroundColor: secondaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Icon(
              Icons.policy,
              size: 56.0,
              color: Colors.blueAccent,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: GetX<AppInfoController>(builder: (controller) {
                return Text(controller.privacyPolicy.value);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
