import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../models/cart_model.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    ;
    Map<String, int> cartItemsPerOder = Map();
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartItemsPerOderToList() {
      return cartItemsPerOder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOderToList();
    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss')
            .parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputForamt = DateFormat("dd/MM/yyyy hh:mm a");
        outputDate = outputForamt.format(inputDate);
      }
      return Text(
        outputDate,
        style: TextStyle(
          fontSize: 19.sp,
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 90.h,
            color: Colors.orange,
            width: double.maxFinite,
            padding: EdgeInsets.only(
              top: 45,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Cart History',
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  )
                ]),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getCartHistoryList().length > 0
                ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          children: [
                            for (int i = 0; i < itemsPerOrder.length; i++)
                              Container(
                                height: 120.h,
                                margin: EdgeInsets.only(bottom: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // this are called immediatly envolve function IEF
                                    // we can do lot of data processing
                                    // (() {
                                    //   DateTime parseDate = DateFormat(
                                    //           'yyyy-MM-dd HH:mm:ss')
                                    //       .parse(getCartHistoryList[listCounter]
                                    //           .time!);
                                    //   var inputDate =
                                    //       DateTime.parse(parseDate.toString());
                                    //   var outputForamt =
                                    //       DateFormat("dd/MM/yyyy hh:mm a");
                                    //   var outputDate =
                                    //       outputForamt.format(inputDate);
                                    //   return Text(
                                    //     outputDate,
                                    //     style: TextStyle(
                                    //       fontSize: 19.sp,
                                    //     ),
                                    //   );
                                    // }()),
                                    // this is replacement of above code bc above code get called immediately when app get start.
                                    timeWidget(listCounter),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(
                                            itemsPerOrder[i],
                                            (index) {
                                              if (listCounter <
                                                  getCartHistoryList.length) {
                                                listCounter++;
                                              }
                                              return index <= 2
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                          right: 4.sp),
                                                      height: 80.h,
                                                      width: 80.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            AppConstants
                                                                    .baseUrl +
                                                                AppConstants
                                                                    .uploads +
                                                                getCartHistoryList[
                                                                        listCounter -
                                                                            1]
                                                                    .img!,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container();
                                            },
                                          ),
                                        ),
                                        Container(
                                          height: 80.h,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Total",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Color.fromARGB(
                                                          255, 78, 77, 77)),
                                                ),
                                                Text(
                                                  itemsPerOrder[i].toString() +
                                                      " Items",
                                                  style: TextStyle(
                                                    fontSize: 21.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    var orderTime =
                                                        cartOrderTimeToList();
                                                    Map<int, CartModel>
                                                        morOrder = {};
                                                    for (int j = 0;
                                                        j <
                                                            getCartHistoryList
                                                                .length;
                                                        j++) {
                                                      if (getCartHistoryList[j]
                                                              .time ==
                                                          orderTime[i]) {
                                                        morOrder.putIfAbsent(
                                                            getCartHistoryList[j]
                                                                .id!,
                                                            () => CartModel.fromJson(
                                                                jsonDecode(jsonEncode(
                                                                    getCartHistoryList[
                                                                        j]))));
                                                      }
                                                    }
                                                    // Get.find<CartController>()
                                                    //     .setItems = morOrder;
                                                    // Get.find<CartController>()
                                                    //     .addToCartList();
                                                    // Get.toNamed(
                                                    //     RoutesHelper.getCartPage());
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(4.sp),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                      border: Border.all(
                                                        width: 1.sp,
                                                        color:
                                                            Colors.deepOrange,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "View more",
                                                      style: TextStyle(
                                                        color:
                                                            Colors.deepOrange,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                : NoDataPage(
                    text: 'You didn\'t buy so far !',
                    imgPath: 'asset/images/empty_history.png',
                  );
          })
        ],
      ),
    );
  }
}
