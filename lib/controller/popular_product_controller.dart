// in general getx service are in repos and apiclient

import 'package:food_delivery_app/data/repository/popular_prod_repo.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  //so to access _popularProductList anywhere in ui
  //we need to call
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;

  Future<void> getPopularPorductList() async {
    Response response = await popularProductRepo.getPopularProductlist();
    if (response.statusCode == 200) {
      print('got products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //^^ we can access this one using publc variable of product model that is 'products'.
      print(_popularProductList);
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = _quantity + 1;
    } else {
      _quantity = _quantity - 1;
    }
  }
}

//most of the api client or http client return the status code as 200 if it is successful
