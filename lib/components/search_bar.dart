import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        // width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 229, 231, 229),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
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
              size: 30,
            ),
            Text(
              'Search dishes',
              style: TextStyle(
                fontSize: 23,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Row(
              children: [
                VerticalDivider(
                  color: Colors.grey,
                  indent: 6,
                  endIndent: 7,
                ),
                Icon(
                  Icons.mic,
                  color: Colors.redAccent,
                  size: 39,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
