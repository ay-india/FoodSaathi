import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/auth/auth_page.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery_app/screens/splash_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/recommended_product_controller.dart';
import 'firebase_options.dart';
import 'helper/dependencies.dart' as dep;

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dep.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // initScreen = await prefs.getInt('initScreen');
  // await prefs.setInt("initScreen", 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // first we have to load the controller in main file then only it can read data

    // Get.find<CartController>().getCartData();

    return GetBuilder<CartController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return ScreenUtilInit(
          builder: (_, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food Saathi',
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
            //-------- comment
            // initialRoute:
            //     initScreen == 0 || initScreen == null ? 'onboard' : 'authpage',
            // routes: {
            //   'authpage': (context) => AuthPage(),
            //   'onboard': (context) => Onboarding(),
            // },
            //-----------
            // home: SplashScreen(),
            initialRoute: RoutesHelper.getSplashPage(),
            getPages: RoutesHelper.routes,
          ),
          designSize: const Size(392.727, 780.09),
        );
      });
    });
  }
}
