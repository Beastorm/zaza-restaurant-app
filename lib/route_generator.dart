import 'package:flutter/material.dart';
import 'package:zaza/screens/login/login_screen.dart';
import 'package:zaza/screens/sign_up/sign_up_screen.dart';
import 'package:zaza/screens/splash_screen/splash_screen_widget.dart';
import 'package:zaza/screens/products_screen/product_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/Products':
        return MaterialPageRoute(builder: (_) => ProductScreenWidget());

      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginScreenWidget());
      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUpScreenWidget());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: SafeArea(child: Center(child: Text('Route Error')))));
    }
  }
}
