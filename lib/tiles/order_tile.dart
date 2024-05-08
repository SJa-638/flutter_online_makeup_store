import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderId;
  
  OrderTile(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'The Order Code is:\n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text('Product Description'),
            SizedBox(height: 6),
            Text(
              'Order Status:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCircle('1', 'Preparation', 1, 1),
                Container(
                  height: 1,
                  width: 40,
                  color: Colors.grey[500],
                ),
                _buildCircle('2', 'Shipping', 1, 2),
                Container(
                  height: 1,
                  width: 40,
                  color: Colors.grey[500],
                ),
                _buildCircle('3', 'Delivery', 1, 3),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(
    String title, String subtitle, int status, int thisStatus) {
    Color backColor;
    Widget child;

    if (status < thisStatus) {
      backColor = Colors.grey;
      child = Text(
        title,
        style: TextStyle(color: Colors.white),
      );
    } else if (status == thisStatus) {
      backColor = Colors.blue;
      child = Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        ],
      );
    } else {
      backColor = Colors.green;
      child = Icon(
        Icons.check,
        color: Colors.white,
      );
    }

    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 20,
          backgroundColor: backColor,
        child: child,
      ),
      Text(subtitle),
      ],
    );
  }
}