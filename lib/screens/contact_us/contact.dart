import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../contants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/app_info_controller.dart';

class ContactScreen extends StatelessWidget {

  final title;
  final AppInfoController _appInfoController = Get.find<AppInfoController>();

  ContactScreen({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Obx(() => ListTile(
                        onTap: () async {
                          var url =
                              "tel:${_appInfoController.restaurantMobileNo.value}";

                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch ';
                          }
                        },
                        trailing: Icon(
                          Icons.phone,
                          color: accentColor,
                        ),
                        title: Text("Mobile"),
                        subtitle:
                            Text(_appInfoController.restaurantMobileNo.value),
                      )),
                  ListTile(
                    onTap: () async {
                      var url =
                          "mailto:${_appInfoController.restaurantEmail.value}";

                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    trailing: Icon(
                      Icons.email,
                      color: accentColor,
                    ),
                    title: Text("Email"),
                    subtitle: Text(_appInfoController.restaurantEmail.value),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
