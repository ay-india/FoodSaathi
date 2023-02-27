import 'package:food_delivery_app/screens/cart_page.dart';
import 'package:food_delivery_app/screens/homepage.dart';
import 'package:food_delivery_app/screens/product_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutesHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String cartPage = '/cart-page';
  static String getInitial() => '#initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getCartPage() => '$cartPage';
  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
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
