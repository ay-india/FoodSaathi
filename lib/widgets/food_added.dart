import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodAdded extends StatelessWidget {
  const FoodAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2.r,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pepperoni Pizza',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Mixed Pizza'),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          '\$18.67',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            '2',
                            style: TextStyle(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.h),
                            padding: EdgeInsets.only(left: 3.w, right: 3.w),
                            width: 70.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20.r,
                              ),
                              color: Colors.orange,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 30.sp,
                                ),
                                // VerticalDivider(
                                //   thickness: 3,
                                //   // color: Colors.white,
                                //   width: 2,
                                // ),
                                Icon(
                                  Icons.add,
                                  size: 30.sp,
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
              backgroundImage: AssetImage(
                'asset/images/friedrice1.jpg',
              ),
              radius: 50.r,
            ),
          ),
        ],
      ),
    );
  }
}
