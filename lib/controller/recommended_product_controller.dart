// in general getx service are in repos and apiclient

import 'package:food_delivery_app/data/repository/popular_prod_repo.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  //so to access _popularProductList anywhere in ui
  //we need to call
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getRecommendedPorductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductlist();
    if (response.statusCode == 200) {
      print('got products');
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //^^ we can access this one using publc variable of product model that is 'products'.
      // print(_recommendedProductList);
      _isLoaded = true;
      update();
    } else {}
  }
}

//most of the api client or http client return the status code as 200 if it is successful
