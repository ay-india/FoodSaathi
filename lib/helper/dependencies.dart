import 'package:food_delivery_app/controller/popular_product_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/repository/popular_prod_repo.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(
    () => ApiClient(appBarUrl: AppConstants.baseUrl),
  );

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //apiClient: Get.find() getx can find the related class of it.

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
