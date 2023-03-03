import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/popular_product_controller.dart';
import '../controller/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularPorductList();
    await Get.find<RecommendedProductController>().getRecommendedPorductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(
        Duration(seconds: 3), () => Get.offNamed(RoutesHelper.getFirstPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ScaleTransition(
          scale: animation,
          child: Center(
            child: Image.asset(
              'asset/images/foodSaathi.jpg',
              width: 259.w,
            ),
          ),
        ),
      ]),
    );
  }
}
