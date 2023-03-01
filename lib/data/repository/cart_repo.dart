import 'dart:convert';

import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  //sharedpreferences stored data in a string
  List<String> cart = [];
  void addToCartList(List<CartModel> cartList) {
    cart = [];
    // convert object to string bc shared preferences only accept string
    cartList.forEach((element) {
      return cart.add(
        jsonEncode(element),
      );
      // jsonEncode (element) -> convert the object to string.
    });
    sharedPreferences.setStringList(AppConstants.cartList, cart);
    //using setStringList bc we are passing list to it
    //------
    print(sharedPreferences.getStringList(AppConstants.cartList));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.cartList)) {
      carts = sharedPreferences.getStringList(AppConstants.cartList)!;
      print('inside getCartList' + carts.toString());
    }
    List<CartModel> cartList = [];

    ///coverting from string to object
    /*carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });*/
    //fancy way of writing above code
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    

    return cartList;
  }
}
