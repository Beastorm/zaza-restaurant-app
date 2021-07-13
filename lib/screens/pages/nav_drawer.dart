import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zaza/screens/orders/orders_screen.dart';
import 'package:zaza/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:zaza/screens/contact_us/contact.dart';

import '../../contants.dart';
import '../account/account_screen.dart';
import '../cart/cart_screen.dart';

// ignore: must_be_immutable
class NavDrawerWidget extends StatelessWidget {
  final pref = GetStorage();
  var scaffoldKey;
  var packageName = "com.zaza";

  NavDrawerWidget({this.scaffoldKey, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        alignment: Alignment.topLeft,
        color: Colors.white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                !pref.hasData("isLogin") ? "Hello Guest" : pref.read("name"),
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              accountEmail: Text(
                !pref.hasData("email") ? "" : pref.read("email"),
                style: TextStyle(color: Colors.white70, fontSize: 14.0),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black87,
                child: Text(
                  !pref.hasData("isLogin")
                      ? "G"
                      : pref.read<String>("name").substring(0, 1).toUpperCase(),
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                if (pref.hasData("isLogin")) {
                  Get.to(UserAccountScreenWidget());
                  //  scaffoldKey.currentState.closeDrawer();
                } else
                  Get.offAllNamed("/Login");
              },
              leading: SvgPicture.asset(
                  "assets/images/ic_perm_contact_calendar_24px.svg"),
              title: Transform.translate(
                offset: Offset(-28, 0),
                child: Text(
                  " My Account",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                if (pref.hasData("isLogin")) {
                  Get.to(OrdersScreenWidget());
                  // scaffoldKey.currentState.closeDrawer();
                } else
                  Get.offAllNamed("/Login");
              },
              leading: SvgPicture.asset("assets/images/order.svg"),
              title: Transform.translate(
                offset: Offset(-28, 0),
                child: Text("My Orders",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (pref.hasData("isLogin")) {
                  Get.toNamed("/Fav");
                  // scaffoldKey.currentState.closeDrawer();
                } else
                  Get.offAllNamed("/Login");
              },
              child: ListTile(
                leading: SvgPicture.asset(
                    "assets/images/ic_bookmark_border_24px.svg"),
                title: Transform.translate(
                  offset: Offset(-28, 0),
                  child: Text("My Favourite",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                if (pref.hasData("isLogin")) {
                  Get.to(CartScreenWidget());
                } else
                  Get.offAllNamed("/Login");
              },
              leading: Transform.translate(
                  offset: Offset(-5, 0),
                  child: SvgPicture.asset(
                    "assets/images/cart.svg",
                    width: 24,
                  )),
              title: Transform.translate(
                offset: Offset(-28, 0),
                child: Text("My Cart",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Divider(
                height: 2,
                color: Colors.grey,
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(ContactScreen(
                  title: "Contact Us",
                ));
              },
              leading: SvgPicture.asset("assets/images/ic_call_24px.svg"),
              title: Transform.translate(
                offset: Offset(-28, 0),
                child: Text("Contact Us",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            ListTile(
              onTap: () {
                try {
                  launch("market://details?id=" + packageName);
                } on PlatformException catch (e) {
                  launch("https://play.google.com/store/apps/details?id=" +
                      packageName);
                } finally {
                  launch("https://play.google.com/store/apps/details?id=" +
                      packageName);
                }
              },
              leading: SvgPicture.asset("assets/images/ic_star_24px.svg"),
              title: Transform.translate(
                offset: Offset(-28, 0),
                child: Text("Rate Our App",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(ContactScreen(
                  title: "Get Help",
                ));
              },
              leading:
                  SvgPicture.asset("assets/images/ic_help_outline_24px.svg"),
              title: Transform.translate(
                offset: Offset(-28, 0),
                child: Text("Help",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(PrivacyPolicyScreenWidget());
              },
              leading: Icon(Icons.policy, color: Color(0xffff7474)),
              title: Transform.translate(
                offset: Offset(-28, 0),
                child: Text("Terms and Conditions*",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ListTile(
              dense: true,
              onTap: () {
                if (pref.hasData("isLogin")) {
                  pref.erase();
                  Get.offAllNamed("/Login");
                } else
                  Get.offAllNamed("/Login");
              },
              leading: Icon(
                pref.hasData("isLogin") ? Icons.arrow_back : Icons.input,
                color: secondaryColor,
              ),
              title: Transform.translate(
                offset: Offset(-30, 0),
                child: Text(pref.hasData("isLogin") ? "LogOut" : "Login",
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
