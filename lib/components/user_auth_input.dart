import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAuthInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final controller;
  const UserAuthInput(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 241, 239, 239),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(
              color: Color.fromARGB(255, 216, 214, 209),
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.r),
          ),
          hintText: hintText,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
