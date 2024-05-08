import 'package:flutter/material.dart';
import '../datas/cart_product.dart';
import '../datas/product_data.dart';
import '../Models/cart_model.dart';

class CartTile extends StatelessWidget {
  //final CartProduct cartProduct;
  final ProductData productData;

  CartTile(this.productData);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      return Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
            width: 150,
            child: Image.network(
              productData.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    productData.title,
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                  Text(
                    'Brand',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'R\$ ${productData.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF00B0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.amber),
                        onPressed: 
                            () {
                                //CartModel.of(context).decProduct(cartProduct);
                              }
                            
                      ),
                      //Text(cartProduct.quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.amber, size: 30),
                        onPressed: () {
                          //CartModel.of(context).incProduct(cartProduct);
                        },
                      ),
                    ],
                  ),
                  TextButton(style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Added padding to decrease the touch area
                    ),
                    child: Text(
                      'Remove',
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                    onPressed: () {
                      //CartModel.of(context).removeCartItem(cartProduct);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: _buildContent(),
    );
  }
}