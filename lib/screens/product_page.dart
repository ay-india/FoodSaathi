import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/screens/user_account.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: height * 0.07,
            left: width * 0.02,
            right: width * 0.03,
          ),
          alignment: Alignment.topLeft,
          height: height * 0.4,
          color: Color.fromARGB(255, 221, 164, 79),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back,
                size: 33,
              ),
              Icon(
                Icons.shopping_cart,
                size: 33,
              ),
            ],
          ),
        ),

        ///White Conatiner part
        Padding(
          padding: EdgeInsets.only(
            top: 250,
          ),
          child: Container(
            padding: EdgeInsets.only(top: height * 0.23),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  height * 0.04,
                ),
                topRight: Radius.circular(
                  height * 0.04,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // product Description
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  'The meat burgers shall be palatable, have a pleasant flavour, characteristic appearance with no visible damage, objectionable colour and odour.',
                  style: TextStyle(fontSize: 19),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Noodles',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '300g/530kcal',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1 portion',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 3,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 15,
                    bottom: 15,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1.3 km from you',
                          style: TextStyle(fontSize: 17),
                        ),
                        RatingBar.builder(
                          itemSize: 24,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ]),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 3,
                ),
                // amount section and add to cart button
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$7.63',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
            top: height * 0.15,
            left: width * 0.15,
            child: CircleAvatar(
              radius: height * .18,
              // backgroundColor: Colors.blue,
              backgroundImage: AssetImage('asset/images/burger1.jpg'),
            ))
        // Column(
        //   children: [
        //     Container(
        //       height: 300,
        //       color: Colors.orangeAccent,
        //     )
        //   ],
        // )
      ],
    ));
  }
}



// Container(
//           color: Colors.red,
//           child: Column(
//             children: [
//               Container(
//                 // margin: EdgeInsets.only(top: 15),
//                 padding: EdgeInsets.only(left: 10, right: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(Icons.arrow_back, size: 34),
//                     Icon(
//                       Icons.shopping_cart,
//                       size: 34,
//                       color: Colors.black54,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),