import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/auth/auth_page.dart';
import 'package:food_delivery_app/auth/login_page.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  // @override
  // void initState() {
  //   SystemChrome.setEnabledSystemUIMode();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(top: 22),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Expanded(
              child: IntroductionScreen(
                pages: [
                  _pageView(
                    'Find a Restaurant',
                    'Search for your favourite Restaurant',
                    'asset/images/fd3.jpg',
                  ),
                  _pageView(
                    'Browse the Menu',
                    'Have your favourite dish',
                    'asset/images/fd6.jpg',
                  ),
                  _pageView(
                    'Order Food',
                    'Save your time by placing order now',
                    'asset/images/fd2.jpg',
                  ),
                  _pageView(
                    'Fast Delivery',
                    'Get hot and tasty food at your place',
                    'asset/images/fd1.jpg',
                  ),
                ],
                done: const Text(
                  'Get started',
                  // style: TextStyle(fontSize: 16),
                ),
                // autoScrollDuration: 3,
                onDone: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthPage(),
                    ),
                  );
                },
                showSkipButton: true,
                skip: const Text('skip'),
                next: const Text('next'),
                onSkip: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthPage(),
                    ),
                  );
                },
                dotsDecorator: DotsDecorator(
                  //------------ here might be some error
                  size: Size(15.w, 35.h),
                  //------------- please verify here if you get any error
                  activeSize: Size(22.w, 10.h),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageViewModel _pageView(var title, var body, var image) {
    return PageViewModel(
      title: title,
      body: body,
      image: Image.asset(image),
      decoration: const PageDecoration(
        // imagePadding: EdgeInsets.only(top: 40),
        // imageAlignment: Alignment.bottomCenter,
        bodyAlignment: Alignment.center,
      ),
    );
  }
}
