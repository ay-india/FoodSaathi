import 'package:food_delivery_app/screens/homepage.dart';
import 'package:food_delivery_app/screens/product_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutesHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static String getInitial() => '#initial';
  static String getPopularFood() => '$popularFood';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
        name: popularFood,
        page: () {
          return ProductPage();
        },
        transition: Transition.fadeIn),
  ];
}
