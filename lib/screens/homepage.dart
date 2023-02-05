import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/components/food_category.dart';
import 'package:food_delivery_app/components/search_bar.dart';
import 'package:food_delivery_app/screens/product_page.dart';
import 'package:food_delivery_app/screens/user_account.dart';
import 'package:food_delivery_app/widgets/food_category.dart';
import 'package:food_delivery_app/widgets/popular_food.dart';

import '../components/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 39,
              // color: Colors.red,
            ),
            //this is for location and account part
            // const Appbar(),

            //for search bar
            // const SearchBar(),

            // Categoris part
            // const FoodCategoryPart(),

            // Popular food

            // Container(
            //   margin: EdgeInsets.only(left: 15),
            //   alignment: Alignment.topLeft,
            //   color: Colors.green,
            //   child: Text(
            //     'Popular Food',
            //     style: TextStyle(fontSize: 21),
            //   ),
            // ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  /// user account and location
                  const Appbar(),

                  /// search option
                  const SearchBar(),
                  //Foood categories
                  const FoodCategoryPart(),

                  Container(
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.topLeft,
                    // color: Colors.green,
                    child: Text(
                      'Popular Food',
                      style: TextStyle(
                          fontSize: 21, color: Color.fromARGB(167, 2, 2, 2)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  PopularFood(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(),
                        ),
                      );
                    },
                    image: 'asset/images/burger.jpg',
                    name: 'HamBurger',
                    description: "Cheesy Mozarelly",
                    rate: '\$22.7',
                    rating: 3,
                  ),
                  PopularFood(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(),
                        ),
                      );
                    },
                    image: 'asset/images/biryani1.jpg',
                    name: 'Egg Biryani',
                    description: "With Curd Raitha",
                    rate: '\$12.7',
                    rating: 4,
                  ),
                  PopularFood(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(),
                        ),
                      );
                    },
                    image: 'asset/images/chicken.jpg',
                    name: 'CrumyChiken',
                    description: "Spicy Gravy",
                    rate: '\$32.7',
                    rating: 5,
                  ),
                  PopularFood(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(),
                        ),
                      );
                    },
                    image: 'asset/images/pizza.jpeg',
                    name: 'CruncyPizza',
                    description: "Cheesy Batter",
                    rate: '\$25.7',
                    rating: 3.5,
                  ),
                ],
              ),
            ),

            // Expanded(
            //   child: Container(
            //     alignment: Alignment.topLeft,
            //     // padding: EdgeInsets.all(10),
            //     margin: EdgeInsets.only(left: 10),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       // mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         const Text(
            //           'Popular Food',
            //           style: TextStyle(
            //             fontSize: 23,
            //             color: Color.fromARGB(167, 2, 2, 2),
            //           ),
            //         ),
            //         ListView(
            //           // shrinkWrap: true,
            //           children: [
            //             Container(
            //               height: 200,
            //               margin: EdgeInsets.all(10),
            //               color: Colors.red,
            //             ),
            //             Container(
            //               height: 200,
            //               margin: EdgeInsets.all(10),
            //               color: Colors.red,
            //             ),
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
