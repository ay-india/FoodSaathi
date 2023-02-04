import 'package:flutter/material.dart';

import '../widgets/food_category.dart';

class FoodCategoryPart extends StatelessWidget {
  const FoodCategoryPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10),
      height: MediaQuery.of(context).size.height * 0.265,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //categori
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text(
              'Categories',
              style:
                  TextStyle(color: Color.fromARGB(167, 2, 2, 2), fontSize: 23),
            ),
          ),
          // list
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                FoodCategory(
                  image: 'asset/images/burger1.jpg',
                  name: "Burger",
                ),
                FoodCategory(
                  image: 'asset/images/biryani1.jpg',
                  name: "Biryani",
                ),
                FoodCategory(
                  image: 'asset/images/pizza2.jpg',
                  name: "Pizza",
                ),
                FoodCategory(
                  image: 'asset/images/chicken.jpg',
                  name: "Chicken",
                ),
                FoodCategory(
                    image: 'asset/images/friedrice1.jpg', name: "Fried Rice"),
                FoodCategory(image: 'asset/images/cake1.jpg', name: "Cake"),
                FoodCategory(image: 'asset/images/dosa1.jpg', name: "Dosa"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
