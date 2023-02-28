import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';

class FoodAdded extends StatelessWidget {
  final String? itemName;
  final String? price;
  final String? image;
  final String? quantity;
  final CartController onRemove;
  final CartController onAdd;
  const FoodAdded(
      {super.key,
      required this.itemName,
      required this.price,
      required this.image,
      required this.quantity,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
