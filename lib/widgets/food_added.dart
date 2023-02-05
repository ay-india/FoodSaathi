import 'package:flutter/material.dart';

class FoodAdded extends StatelessWidget {
  const FoodAdded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36),
      padding: EdgeInsets.only(left: 15, right: 15),
      height: 135,
      width: double.infinity,
      // color: Colors.red,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              left: 24,
            ),
            padding: EdgeInsets.only(
              left: 100,
              right: 10,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
                topRight: Radius.circular(35),
                topLeft: Radius.circular(100),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: Offset(0, 3),
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pepperoni Pizza',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Mixed Pizza'),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '\$18.67',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            '2',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 3, right: 3),
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              color: Colors.orange,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                // VerticalDivider(
                                //   thickness: 3,
                                //   // color: Colors.white,
                                //   width: 2,
                                // ),
                                Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 15,
            child: CircleAvatar(
              // backgroundColor: Colors.pink,
              backgroundImage: AssetImage(
                'asset/images/friedrice1.jpg',
              ),
              radius: 50,
            ),
          ),
        ],
      ),
    );
  }
}
