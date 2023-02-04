import 'package:flutter/material.dart';

class AccountOptions extends StatelessWidget {
  final String text;
  const AccountOptions({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 2,
        right: 3,
        top: 3,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          Icon(
            Icons.forward,
          ),
        ],
      ),
    );
  }
}
