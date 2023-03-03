import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/screens/cart_history.dart';
import 'package:food_delivery_app/screens/cart_page.dart';

import '../screens/user_account.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, size: 34.r),
                  Column(
                    children: [
                      Text(
                        'Town',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19.sp),
                      ),
                      Text(
                        'City',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          // Container(
          //   height: 45.h,
          //   width: 45.w,
          //   child: Center(
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const CartPage(),
          //           ),
          //         );
          //       },
          //       child: Icon(
          //         Icons.shopping_cart_checkout_outlined,
          //         size: 38.r,
          //       ),
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(30.r),
          //     color: Color.fromARGB(255, 190, 182, 177),
          //   ),
          // ),
          // Container(
          //   height: 45.h,
          //   width: 45.w,
          //   child: Center(
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const CartHistory(),
          //           ),
          //         );
          //       },
          //       child: Icon(
          //         Icons.account_circle,
          //         size: 38.r,
          //       ),
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(30.r),
          //     color: Color.fromARGB(255, 190, 182, 177),
          //   ),
          // )
        ],
      ),
    );
  }
}
