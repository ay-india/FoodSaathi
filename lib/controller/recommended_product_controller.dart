// in general getx service are in repos and apiclient

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
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
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  //this is private
  int _quantity = 0;
  //creating public getter for _quantity variable
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems;
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

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
    //need to update it on every tap of incrment and decrement
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item Count",
        "You can't reduce more!",
        backgroundColor: Color.fromARGB(255, 242, 188, 117),
        colorText: Colors.white,
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        "Item Count",
        "Maximum limit reached!",
        backgroundColor: Color.fromARGB(255, 243, 185, 110),
        colorText: Colors.white,
      );
      return 20;
    } else
      return quantity;
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cart.addItem(product, quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {});
    /*} else {
      Get.snackbar(
        "Item Count",
        "Atleast add 1 item!",
        backgroundColor: Color.fromARGB(255, 242, 188, 117),
        colorText: Colors.white,
      );
    }*/
  }

  int get totalItems {
    return _cart.totalItems;
  }
}

//most of the api client or http client return the status code as 200 if it is successful
