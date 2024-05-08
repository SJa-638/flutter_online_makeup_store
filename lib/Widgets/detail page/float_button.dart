import 'package:flutter/material.dart';

import '../../utils/dimesnsion.dart';

class FloatButtonContainer extends StatelessWidget {
  const FloatButtonContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: getWidth(15),
      ),
      height: getHeight(50),
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        primary: Colors.white,),
        onPressed: () {},
        child: Row(
          children: [
            SizedBox(
              width: getWidth(80),
            ),
            Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: getHeight(24),
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              width: getWidth(50),
            ),
            Icon(
              Icons.shopping_cart,
              size: getHeight(28),
              color: Color(0XFFFF00B0),
            ),
          ],
        ),
      ),
    );
  }
}
