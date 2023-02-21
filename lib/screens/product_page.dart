import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/screens/cart_page.dart';
import 'package:food_delivery_app/screens/user_account.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 54.7.h,
            left: 8.w,
            right: 12.w,
          ),
          alignment: Alignment.topLeft,
          height: 39.h,
          color: Color.fromARGB(255, 221, 164, 79),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: IgnorePointer(
                  child: Icon(
                    Icons.arrow_back,
                    size: 31.r,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                  print(MediaQuery.of(context).size.height);
                },
                child: IgnorePointer(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 33.r,
                  ),
                ),
              ),
            ],
          ),
        ),

        ///White Conatiner part
        Padding(
          padding: EdgeInsets.only(
            top: 250.h,
          ),
          child: Container(
            padding: EdgeInsets.only(top: 180.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  31.r,
                ),
                topRight: Radius.circular(
                  31.r,
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
                  style: TextStyle(fontSize: 19.sp),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Noodles',
                        style: TextStyle(
                          fontSize: 30.sp,
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
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            '1 portion',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  indent: 10.w,
                  endIndent: 10.w,
                  thickness: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 13.h,
                    bottom: 13.h,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1.3 km from you',
                          style: TextStyle(fontSize: 17.sp),
                        ),
                        RatingBar.builder(
                          itemSize: 24.r,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                          itemBuilder: (context, _) => const Icon(
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
                  indent: 10.w,
                  endIndent: 10.w,
                  thickness: 3,
                ),
                // amount section and add to cart button
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$7.63',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartPage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                            SizedBox(
                              width: 13.h,
                            ),
                            CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.w,
                            vertical: 10.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30.r,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 119.h,
          left: 59.w,
          child: CircleAvatar(
            radius: 140.h,
            // backgroundColor: Colors.blue,
            backgroundImage: AssetImage('asset/images/burger1.jpg'),
          ),
        ),
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