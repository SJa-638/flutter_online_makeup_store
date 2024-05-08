import 'package:flutter/material.dart';
import '../models/cart_model.dart'; // Assuming 'cart_model.dart' file is in the correct location

class DiscountCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(
          'Discount Coupon',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFCD2DB),
          ),
        ),
        leading: Icon(Icons.card_giftcard),
        trailing: Icon(Icons.add),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'DEnter your coupon code',
              ),
              initialValue: CartModel.of(context).couponCode ?? '',
              onFieldSubmitted: (text) {
                if (text == 'YOUR_VALID_COUPON_CODE') {
                  // Replace 'YOUR_VALID_COUPON_CODE' with the actual valid coupon code
                  CartModel.of(context).setCoupon(text, 10); // Assuming 10% discount
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 5),
                    backgroundColor: Color(0XFFFCD2DB),
                    content: Text(
                      'Your 10% discount has been applied',
                    ),
                  ));
                } else {
                  CartModel.of(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      'This coupon does not exist. Please check if your code is correct',
                    ),
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}