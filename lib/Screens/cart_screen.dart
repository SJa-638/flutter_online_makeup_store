import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/cart_model.dart';
import '../models/user_model.dart';
import '../screens/login_screen.dart';
import '../tiles/cart_tile.dart';
import '../widgets/cart_price.dart';
import '../widgets/discount_cart.dart';
import '../widgets/ship_card.dart';
import 'order_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFFFCD2DB)),
        backgroundColor: Color(0xFFFF00B0),
        title: Text(
          'My Cart',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 8),
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                var quantityProducts = model.products.length;
                return Text(
                  '${quantityProducts ?? 0} ${quantityProducts == 1 ? 'ITEM' : 'ITEMS'}',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ScopedModelDescendant<CartModel>(
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!UserModel.of(context).isLoggedIn) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.remove_shopping_cart,
                    color:Color(0xFFFF00B0),
                    size: 100,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sign in or sign up \n'
                    'to add products \n to your cart',
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF00B0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor:Color(0xFFFF00B0)),
                    child: Text(
                      'ENTRAR',
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (model.products == null || model.products.isEmpty) {
            return Center(
              child: Text(
               'You donot have any \nproducts in the cart.',
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF00B0),
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView(
              children: <Widget>[
                /* Column(
                  children: model.products.map((product) {
                    return CartTile(product);
                  }).toList(),
                ), */
                DiscountCart(),
                ShipCard(),
                CartPrice(
                  () async {
                    var orderId = await model.finishOrder();
                    if (orderId != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => OrderScreen(orderId),
                        ),
                      );
                    }
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}