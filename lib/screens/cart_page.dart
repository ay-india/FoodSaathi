import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/recommended_product_controller.dart';
import 'package:food_delivery_app/screens/homepage.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/widgets/food_added.dart';
import 'package:get/get.dart';

import '../routes/routes_helper.dart';

class CartPage extends StatelessWidget {
  final String page;
  const CartPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 245, 244, 244),
      padding: EdgeInsets.only(
        top: 60.h,
        // left: 1,
        // right: 13,
        // bottom: 6,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                page == 'product'
                    ? InkWell(
                        child: Icon(
                          Icons.arrow_back,
                          size: 33.sp,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    : Container(),
                SizedBox(
                  width: 140.w,
                ),
                InkWell(
                  child: Icon(
                    Icons.home_outlined,
                    size: 33.sp,
                  ),
                  onTap: () {
                    Get.toNamed(RoutesHelper.getFirstPage());
                  },
                ),
                InkWell(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 33.sp,
                  ),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          // Food added

          Expanded(
            child: GetBuilder<CartController>(
              builder: (cartController) {
                var cartList = cartController.getItems;
                return cartList.length > 0
                    ? MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          itemCount: cartList.length,
                          itemBuilder: (_, index) {
                            // return FoodAdded(
                            //   itemName: cartList[index].name!,
                            //   price: cartList[index].price.toString(),
                            //   image: AppConstants.baseUrl +
                            //       AppConstants.uploads +
                            //       cartList[index].img!,
                            //       quantity: cartList[index].quantity.toString(),
                            //       onAdd: cartController.addItem(cartList[index].product!, 1),
                            //       onRemove: cartController.addItem(cartList[index].product!, -1)
                            // );
                            return GestureDetector(
                              onTap: () {
                                var recommendedIndex =
                                    Get.find<RecommendedProductController>()
                                        .recommendedProductList
                                        .indexOf(cartList[index].product!);
                                if (recommendedIndex >= 0) {
                                  Get.toNamed(RoutesHelper.getPopularFood(
                                      recommendedIndex, 'cartpage'));
                                } else {
                                  Get.snackbar(
                                    'History Product',
                                    'Product review is not available for history product',
                                    backgroundColor: Colors.deepOrange,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 36.h),
                                padding: EdgeInsets.only(left: 15, right: 15).w,
                                height: 135.h,
                                width: double.infinity,
                                // color: Colors.red,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                        left: 24,
                                      ).w,
                                      padding: EdgeInsets.only(
                                        left: 100.w,
                                        right: 10.w,
                                        top: 10.h,
                                        bottom: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        // color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(35.r),
                                          bottomRight: Radius.circular(35.r),
                                          topRight: Radius.circular(35.r),
                                          topLeft: Radius.circular(100.r),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 2.r,
                                            offset: Offset(0, 3),
                                            color: Color.fromARGB(
                                                    255, 215, 215, 213)
                                                .withOpacity(0.3),
                                            spreadRadius: 2.r,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartList[index].name!,
                                            style: TextStyle(
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text('Chatpatta'),
                                                  SizedBox(
                                                    height: 15.h,
                                                  ),
                                                  Text(
                                                    "₹" +
                                                        cartList[index]
                                                            .price
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize: 26.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      cartList[index]
                                                          .quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 23.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5.h),
                                                      padding: EdgeInsets.only(
                                                          left: 3.w,
                                                          right: 3.w),
                                                      width: 70.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          20.r,
                                                        ),
                                                        color: Colors.orange,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 30.sp,
                                                            ),
                                                          ),
                                                         
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 30.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 15.h,
                                      child: CircleAvatar(
                                        // backgroundColor: Colors.pink,
                                        backgroundImage: NetworkImage(
                                          AppConstants.baseUrl +
                                              AppConstants.uploads +
                                              cartList[index].img!,
                                        ),
                                        radius: 50.r,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : NoDataPage(text: '');
              },
            ),
          ),

          GetBuilder<CartController>(builder: (cartController) {
            return Container(
              height: 100.h,
              width: double.infinity,
              padding: EdgeInsets.all(4.sp),
              color: cartController.getItems.length > 0
                  ? Color.fromARGB(255, 238, 237, 237)
                  : Color.fromARGB(255, 249, 248, 248),
              child: cartController.getItems.length > 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total: ₹' + cartController.totalAmount.toString(),
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                        Divider(
                          thickness: 3.sp,
                          indent: 16.w,
                          endIndent: 16.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('checkout tapped');
                            cartController.addToHistory();
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15.w, right: 15.w),
                            alignment: Alignment.center,
                            height: 40.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(
                                30.r,
                              ),
                            ),
                            child: Text(
                              'CHECKOUT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Container(),
            );
          })
        ],
      ),
    ));
  }
}
