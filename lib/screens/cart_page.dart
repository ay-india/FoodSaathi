import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/widgets/food_added.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    size: 33.sp,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Order Details',
                  style: TextStyle(
                    fontSize: 27.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),

          // Food added

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                FoodAdded(),
                FoodAdded(),
                FoodAdded(),
                FoodAdded(),
                FoodAdded(),
              ],
            ),
          ),
          Container(
            height: 100.h,
            width: double.infinity,
            padding: EdgeInsets.all(4.sp),
            color: Color.fromARGB(255, 238, 237, 237),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                'Total: \$32',
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
              Container(
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
              )
            ]),
          )
        ],
      ),
    ));
  }
}
