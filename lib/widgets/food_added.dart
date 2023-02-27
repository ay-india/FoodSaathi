import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodAdded extends StatelessWidget {
  final String? itemName;
  final String? price;
  final String? image;
  final String? quantity;
  const FoodAdded(
      {super.key,
      required this.itemName,
      required this.price,
      required this.image,
      required this.quantity});

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
                  itemName!,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Chatpatta'),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "\$" + price!,
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
                            quantity!,
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
                                  Icons.remove,
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
              backgroundImage: NetworkImage(
                image!,
              ),
              radius: 50.r,
            ),
          ),
        ],
      ),
    );
  }
}
