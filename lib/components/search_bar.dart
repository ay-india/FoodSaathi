import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23.r),
      child: Container(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        // width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Color.fromARGB(255, 229, 231, 229),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.r,
              spreadRadius: 2.r,
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.search,
              color: Colors.redAccent,
              size: 30.r,
            ),
            Text(
              'Search dishes',
              style: TextStyle(
                fontSize: 23.sp,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              width: 40.h,
            ),
            Row(
              children: [
                VerticalDivider(
                  color: Colors.grey,
                  indent: 6.w,
                  endIndent: 7.w,
                ),
                Icon(
                  Icons.mic,
                  color: Colors.redAccent,
                  size: 39.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
