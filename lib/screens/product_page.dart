import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/screens/cart_page.dart';
import 'package:food_delivery_app/screens/user_account.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controller/recommended_product_controller.dart';

class ProductPage extends StatelessWidget {
  int pageId;
  ProductPage({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<RecommendedProductController>()
        .initProduct(Get.find<CartController>());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 54.7.h,
              left: 8.w,
              right: 12.w,
            ),
            alignment: Alignment.topLeft,
            height: 39.h,
            color: Color.fromARGB(255, 221, 164, 79),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: IgnorePointer(
                    child: Icon(
                      Icons.arrow_back,
                      size: 31.r,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                    print(MediaQuery.of(context).size.height);
                  },
                  child: IgnorePointer(
                    child: Icon(
                      Icons.shopping_cart,
                      size: 33.r,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: 250.h,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 180.h),
              decoration: BoxDecoration(
                color: Colors.white,
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
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19.sp),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            itemPadding:
                                EdgeInsets.symmetric(horizontal: 4.0.w),
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
                  // amount section and add to cart button
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         '\$${product.price!}',
                  //         style: TextStyle(
                  //             fontSize: 19.sp,
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //       ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => const CartPage(),
                  //             ),
                  //           );
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           padding: EdgeInsets.symmetric(
                  //             horizontal: 13.w,
                  //             vertical: 10.h,
                  //           ),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(
                  //               30.r,
                  //             ),
                  //           ),
                  //         ),
                  //         child:Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               'Add to Cart',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 17.sp,
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               width: 13.h,
                  //             ),
                  //             CircleAvatar(
                  //               child: Icon(
                  //                 Icons.add,
                  //                 color: Colors.grey,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          ///White Conatiner part

          Positioned(
            top: 119.h,
            left: 59.w,
            child: CircleAvatar(
              radius: 140.h,
              // backgroundColor: Colors.blue,
              backgroundImage: NetworkImage(
                  AppConstants.baseUrl + '/uploads/' + product.img!),
            ),
          ),
          // Column(
          //   children: [
          //     Container(
          //       height: 300,
          //       color: Colors.orangeAccent,
          //     )
          //   ],
          // )
        ],
      ),
      bottomNavigationBar: GetBuilder<RecommendedProductController>(
        builder: (recommendedProudct) {
          return Container(
            height: 80.h,
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 15.h,
              bottom: 14.h,
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 249, 241, 230),
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
                              recommendedProudct.setQuantity(false);
                            },
                            child: const Icon(
                              Icons.remove,
                            ),
                          ),
                          Text(
                            recommendedProudct.quantity.toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              recommendedProudct.setQuantity(true);
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
                        recommendedProudct.addItem(product);
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
                      // SizedBox(
                      //   width: 13.h,
                      // ),
                      // CircleAvatar(
                      //   child: Icon(
                      //     Icons.add,
                      //     color: Colors.grey,
                      //   ),
                      // ),
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

// Container(
//           color: Colors.red,
//           child: Column(
//             children: [
//               Container(
//                 // margin: EdgeInsets.only(top: 15),
//                 padding: EdgeInsets.only(left: 10, right: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(Icons.arrow_back, size: 34),
//                     Icon(
//                       Icons.shopping_cart,
//                       size: 34,
//                       color: Colors.black54,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),