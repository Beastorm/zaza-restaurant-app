import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../favourite/favourite_screen.dart';
import '../home/home_screen.dart';
import '../menu/menu_screen.dart';
import '../not_login_screen.dart';
import '../orders/orders_screen.dart';
import 'nav_drawer.dart';

// ignore: must_be_immutable
class PagesScreenWidget extends StatefulWidget {
  dynamic currentTab;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget currentPage = HomeScreenWidget();

  PagesScreenWidget({
    Key key,
    this.currentTab,
  }) : super(key: key);

  @override
  _PagesScreenWidgetState createState() => _PagesScreenWidgetState();
}

class _PagesScreenWidgetState extends State<PagesScreenWidget> {
  final pref = GetStorage();

  initState() {
    super.initState();
    _selectTab(widget.currentTab);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 1:
          widget.currentPage = MenuScreenWidget();
          break;
        case 3:
          widget.currentPage = pref.hasData("isLogin")
              ? OrdersScreenWidget()
              : NotLoginScreenWidget();
          break;
        case 0:
          widget.currentPage =
              HomeScreenWidget(parentScaffoldKey: widget.scaffoldKey);
          break;
        case 4:
          widget.currentPage = pref.hasData("isLogin")
              ? FavouriteScreenWidget()
              : NotLoginScreenWidget();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          const url = "tel:1234567890";

          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: const Icon(
          Icons.call,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          // selectedFontSize: 0,
          // unselectedFontSize: 0,
          iconSize: 22,
          elevation: 0,
          backgroundColor: Colors.grey[200],
          selectedIconTheme: IconThemeData(size: 28),
          unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
          currentIndex: widget.currentTab,
          onTap: (int i) {
            this._selectTab(i);
          },
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Menu",
            ),
            BottomNavigationBarItem(icon: Icon(null), label: "Call"),
            BottomNavigationBarItem(
              icon: new Icon(Icons.local_mall),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.bookmark_outline_rounded),
              label: "Favourite",
            ),
          ],
        ),
      ),
      drawer: NavDrawerWidget(
        scaffoldKey: widget.scaffoldKey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: widget.currentPage,
    );
  }
}
