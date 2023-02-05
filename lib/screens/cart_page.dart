import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/food_added.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 245, 244, 244),
      padding: EdgeInsets.only(
        top: 60,
        // left: 1,
        // right: 13,
        // bottom: 6,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    size: 33,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Order Details',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),

          // Food added

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                FoodAdded(),
                FoodAdded(),
                FoodAdded(),
                FoodAdded(),
                FoodAdded(),
              ],
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(4),
            color: Color.fromARGB(255, 238, 237, 237),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                'Total: \$32',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Divider(
                thickness: 3,
                indent: 16,
                endIndent: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                child: Text(
                  'CHECKOUT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    ));
  }
}
