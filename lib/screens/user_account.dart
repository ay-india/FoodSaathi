import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/components/account_options.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 13.w, right: 14.w, top: 4.h),
        margin: EdgeInsets.only(top: 37.h),
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // InkWell(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: const Icon(
            //     Icons.arrow_back,
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(30.r),
              height: 290.h,
              // color: Colors.yellow,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 86.r,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRr0YlatAy-hrNCQjzZ7fqDzNiXt7HGmzVaA&usqp=CAU',
                    ),
                  ),

                  //--------------------------------------------------------
                  /// ----this container is doing the same circleavatar work
                  // Container(
                  //   height: 180,
                  //   width: 180,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(106),
                  //     color: Colors.blue,
                  //     image: DecorationImage(
                  //         image: NetworkImage(
                  //             'https://i.pinimg.com/736x/d0/7a/f6/d07af684a67cd52d2f10acd6208db98f.jpg'),
                  //         fit: BoxFit.cover),
                  //   ),
                  // )
                  ///------------------------------------------
                  ///
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    'Ashish',
                    style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '+919142552948',
                    style: TextStyle(
                      fontSize: 16.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )

            // now this is for my account detail
            ,
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.r),
                child: Column(
                  children: [
                    AccountOptions(text: "My Profile"),
                    GestureDetector(
                      onTap: () {},
                      child: AccountOptions(text: 'Order History'),
                    ),
                    AccountOptions(text: 'My voucher'),
                    AccountOptions(text: 'Notification'),
                    AccountOptions(text: 'About Us'),
                    AccountOptions(text: 'Contact Us'),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60.h,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ).w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.r),
                        color: Colors.grey[400],
                      ),
                      child: InkWell(
                        onTap: () {
                          signUserOut();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Sign Out",
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    )
                  ],
                ),
                // color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
