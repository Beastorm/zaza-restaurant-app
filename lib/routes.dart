import 'package:get/get.dart';
import 'package:zaza/screens/cart/cart_screen.dart';
import 'package:zaza/screens/favourite/favourite_screen.dart';
import 'package:zaza/screens/login/login_screen.dart';
import 'package:zaza/screens/pages/pages_screen_widget.dart';
import 'package:zaza/screens/products_screen/product_screen.dart';
import 'package:zaza/screens/sign_up/sign_up_screen.dart';
import 'package:zaza/screens/splash_screen/splash_screen_widget.dart';

class ZAzaRouter {
  static final route = [
    GetPage(
      name: '/Login',
      page: () => LoginScreenWidget(),
    ),
    GetPage(
      name: '/SignUp',
      page: () => SignUpScreenWidget(),
    ),
    GetPage(
      name: '/Pages',
      page: () => PagesScreenWidget(),
    ),
    GetPage(
      name: '/Splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/Products',
      page: () => ProductScreenWidget(),
    ),
    GetPage(
      name: '/Fav',
      page: () => FavouriteScreenWidget(),
    ),
    GetPage(
      name: '/Cart',
      page: () => CartScreenWidget(),
    )
  ];
}
