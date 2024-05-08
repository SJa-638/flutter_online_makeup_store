import 'package:flutter/material.dart';
import '../Models/user_model.dart'; 
import '../Screens/login_screen.dart';
import '../tiles/order_tile.dart';

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UserModel.of(context).isLoggedIn) {
      // Assuming UserModel is responsible for fetching orders instead of Firestore
      // Replace Firestore operations with UserModel methods to get user's orders
      var user = UserModel.of(context).currentUser;

      if (user == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      
      if (user.orders.isEmpty) {
        return Center(
          child: Text(
            'No orders found.',
            style: TextStyle(fontSize: 18),
          ),
        );
      } else {
        return ListView(
          children: user.orders.map((order) => OrderTile(order.orderId)).toList(),
        );
      }
    } else {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.view_list, size: 80, color: Colors.amber),
            SizedBox(height: 16),
            Text(
              'Log in to follow along!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text(
                'Sign in',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            )
          ],
        ),
      );
    }
  }
}