import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninButton extends StatelessWidget {
  final image;
  final text;
  const SigninButton({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      // clipBehavior: Clip.antiAlias,
      width: 177.w,
      padding: EdgeInsets.fromLTRB(1.w, 6.h, 1.w, 6.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.5.w),
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 35.34.r,
            // height: 50,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.sp,
            ),
          )
        ],
      ),
    );
  }
}
