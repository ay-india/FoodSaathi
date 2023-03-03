import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/food_category.dart';
import 'package:food_delivery_app/components/search_bar.dart';
import 'package:food_delivery_app/controller/recommended_product_controller.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/screens/product_page.dart';
import 'package:food_delivery_app/screens/user_account.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/food_category.dart';
import 'package:food_delivery_app/widgets/popular_food.dart';
import 'package:get/get.dart';

import '../components/appbar.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  /// user account and location
                  const Appbar(),

                  /// search option
                  const SearchBar(),
                  //Foood categories
                  const FoodCategoryPart(),

                  Container(
                    margin: EdgeInsets.only(left: 15.w),
                    alignment: Alignment.topLeft,
                    // color: Colors.green,
                    child: Text(
                      'Popular Food',
                      style: TextStyle(
                          fontSize: 21.sp, color: Color.fromARGB(167, 2, 2, 2)),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  GetBuilder<RecommendedProductController>(
                    builder: (recommendedProduct) {
                      return recommendedProduct.isLoaded
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: recommendedProduct
                                  .recommendedProductList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PopularFood(
                                  onTap: () {
                                    Get.toNamed(RoutesHelper.getPopularFood(
                                        index, 'home'));
                                  },
                                  image: AppConstants.baseUrl +
                                      "/uploads/" +
                                      recommendedProduct
                                          .recommendedProductList[index].img!,
                                  //ban operator at last is to tell that its value is not null
                                  name: recommendedProduct
                                      .recommendedProductList[index].name!,
                                  description: recommendedProduct
                                      .recommendedProductList[index]
                                      .description!,

                                  rate: "\₹" +
                                      recommendedProduct
                                          .recommendedProductList[index].price!
                                          .toString(),
                                  rating: recommendedProduct
                                      .recommendedProductList[index].stars!
                                      .toString(),
                                );
                              })
                          : Container(
                              height: 300.h,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                color: Colors.orangeAccent,
                                strokeWidth: 1,
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
