import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imgPath;

  const NoDataPage(
      {super.key,
      required this.text,
      this.imgPath = 'asset/images/empty_cart.png'});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100.h),
      color: Color.fromARGB(255, 249, 248, 248),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            imgPath,
            height: 350.h,
            width: 400.w,
          ),
          text.isEmpty
              ? Container()
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
        ],
      ),
    );
  }
}
