import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountOptions extends StatelessWidget {
  final String text;
  const AccountOptions({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 2.w,
        right: 3.w,
        top: 3.h,
        bottom: 17.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 22.sp),
          ),
          Icon(
            Icons.forward,
          ),
        ],
      ),
    );
  }
}
