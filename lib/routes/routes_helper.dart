import 'package:food_delivery_app/screens/cart_page.dart';
import 'package:food_delivery_app/screens/homepage.dart';
import 'package:food_delivery_app/screens/product_page.dart';
import 'package:food_delivery_app/screens/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutesHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String cartPage = '/cart-page';
  static String getInitial() => '#initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSplashPage() => '$splashPage';
  static List<GetPage> routes = [
    GetPage(name: splashPage, page: ()=>SplashScreen()), 
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        // var page = Get.parameters['page'];
        return ProductPage(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
