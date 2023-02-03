import 'package:flutter/material.dart';

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
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 241, 239, 239),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 216, 214, 209),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hintText,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
