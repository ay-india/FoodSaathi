import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/popular_product_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/data/repository/popular_prod_repo.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(
    () => ApiClient(appBarUrl: AppConstants.baseUrl),
  );

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()),fenix: true);
  //apiClient: Get.find() getx can find the related class of it.
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()),fenix: true);
  Get.lazyPut((() => CartRepo()),fenix: true);

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()),fenix:true);

  //
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()),fenix:true);
  Get.lazyPut(() => CartController(cartRepo: Get.find()),fenix: true);
}
