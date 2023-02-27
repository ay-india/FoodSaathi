import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/screens/cart_page.dart';
import 'package:food_delivery_app/screens/homepage.dart';
import 'package:food_delivery_app/screens/user_account.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controller/recommended_product_controller.dart';
import '../routes/routes_helper.dart';

class ProductPage extends StatelessWidget {
  int pageId;
  ProductPage({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<RecommendedProductController>()
        .initProduct(product, Get.find<CartController>());
    Get.put(() => CartController(cartRepo: Get.find()));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 9.7.h,
                left: 8.w,
                right: 12.w,
              ),
              alignment: Alignment.topLeft,
              height: 40.h,
              // color: Color.fromARGB(255, 221, 164, 79),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => HomePage());
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back,
                          size: 31.r,
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<RecommendedProductController>(
                      builder: (controller) {
                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const CartPage(),
                            //   ),
                            // );
                          },
                          child: Material(
                            child: Icon(
                              Icons.shopping_cart,
                              size: 33.r,
                            ),
                          ),
                        ),
                        Get.find<RecommendedProductController>().totalItems >= 1
                            ? Positioned(
                                top: 0.h,
                                right: 0.r,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => CartPage());
                                  },
                                  child: Icon(
                                    Icons.circle,
                                    size: 20.r,
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            : Container(),
                        Get.find<RecommendedProductController>().totalItems >= 1
                            ? Positioned(
                                top: 3.h,
                                right: 6.r,
                                child: Text(
                                  Get.find<RecommendedProductController>()
                                      .totalItems
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    );
                  })
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 65.h),
                // color: Colors.red,
                child: Stack(
                  // fit: StackFit.loose,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 170.h,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(top: 180.h),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 246, 237, 221),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              31.r,
                            ),
                            topRight: Radius.circular(
                              31.r,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // product Description
                            Text(
                              product.description!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 19.sp),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, bottom: 15.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name!,
                                    style: TextStyle(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '300g/530kcal',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        '1 portion',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              indent: 10.w,
                              endIndent: 10.w,
                              thickness: 3.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: 13.h,
                                bottom: 13.h,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '1.3 km from you',
                                      style: TextStyle(fontSize: 17.sp),
                                    ),
                                    RatingBar.builder(
                                      itemSize: 24.r,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(
                                          horizontal: 4.0.w),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ]),
                            ),
                            Divider(
                              indent: 10.w,
                              endIndent: 10.w,
                              thickness: 3,
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///White Conatiner part
                    ///
                    ///product imagae part
                    ///

                    Positioned(
                      // top: 7.h,
                      left: 10.w,
                      child: CircleAvatar(
                        radius: 170.h,
                        // backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage(
                            AppConstants.baseUrl + '/uploads/' + product.img!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      ///bottom navigation part // add to cart and item increase
      bottomNavigationBar: GetBuilder<RecommendedProductController>(
        builder: (recommendedProduct) {
          return Container(
            height: 80.h,
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 15.h,
              bottom: 14.h,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 249, 239, 226),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(18.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹${product.price!}',
                  style: TextStyle(
                      fontSize: 29.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.r),
                      height: 40.h,
                      width: 75.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.r,
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              recommendedProduct.setQuantity(false);
                            },
                            child: const Icon(
                              Icons.remove,
                            ),
                          ),
                          Text(
                            recommendedProduct.inCartItems.toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              recommendedProduct.setQuantity(true);
                            },
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        recommendedProduct.addItem(product);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 13.w,
                          vertical: 13.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30.r,
                          ),
                        ),
                      ),
                      child: Text(
                        ' Add to Cart ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
