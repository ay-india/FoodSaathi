import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/screens/user_account.dart';
import 'package:food_delivery_app/widgets/food_category.dart';

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
            //this is for location and account part
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 34),
                          Column(
                            children: [
                              Text(
                                'Town',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              Text(
                                'City',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserAccount(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.account_circle,
                          size: 38,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 190, 182, 177),
                    ),
                  )
                ],
              ),
            ),

            //for search bar
            Container(
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
            ),

            // Categoris part
            Container(
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
                      style: TextStyle(
                          color: Color.fromARGB(167, 2, 2, 2), fontSize: 23),
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
                            image: 'asset/images/friedrice1.jpg',
                            name: "Fried Rice"),
                        FoodCategory(
                            image: 'asset/images/cake1.jpg', name: "Cake"),
                        FoodCategory(
                            image: 'asset/images/dosa1.jpg', name: "Dosa"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Popular food
            Container(
              alignment: Alignment.topLeft,
              // padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Popular Food',
                    style: TextStyle(
                      fontSize: 23,
                      color: Color.fromARGB(167, 2, 2, 2),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
