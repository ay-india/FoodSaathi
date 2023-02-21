import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodCategory extends StatelessWidget {
  final String image;
  final String name;
  const FoodCategory({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10).r,
      // padding: EdgeInsets.all(10),
      height: 150.h,
      width: 100.w,
      // color: Colors.green,
      decoration: BoxDecoration(
          // color: Colors.green,
          // border: Border.all(),
          // borderRadius: BorderRadius.circular(30),
          ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3).r,
            height: 100.h,
            width: 140.w,
            decoration: BoxDecoration(
              // color: Colors.yellow,
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2.r,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
              borderRadius: BorderRadius.circular(25.r),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            // child: Image.asset(
            //   image,
            //   fit: BoxFit.cover,
            // ),
          ),
          SizedBox(
            height: 6.h,
          ),
          // Container(
          //   height: 100,
          //   width: 90,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(15),
          //     child: Image.asset(
          //       image,
          //     ),
          //   ),
          // ),

          Text(
            name,
            style: TextStyle(fontSize: 20.sp, color: Color.fromARGB(167, 2, 2, 2)),
          ),
        ],
      ),
    );
  }
}
