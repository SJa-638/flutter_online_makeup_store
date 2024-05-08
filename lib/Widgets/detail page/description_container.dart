import 'package:flutter/material.dart';

import 'package:flutter_online_makeup_store/Models/product.dart';
import 'package:flutter_online_makeup_store/utils/dimesnsion.dart';

class DescriptionContainer extends StatelessWidget {
  DescriptionContainer({
    Key? key,
    required this.curProduct,
  });
  final Product? curProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff242424),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getHeight(40)),
          topRight: Radius.circular(
            getHeight(40),
          ),
        ),
      ),
      height: getHeight(700),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: getHeight(30),
          ),
          Text(
            'About',
            style: TextStyle(
              fontFamily: 'Anton',
              fontSize: getHeight(35),
              color: Colors.white,
              letterSpacing: getHeight(0.5),
            ),
          ),
          Divider(
            thickness: getHeight(5),
            color: Colors.grey,
          ),
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(
                getHeight(10),
              ),
              child: Text(
                curProduct!.description,
                style: TextStyle(
                  fontSize: getHeight(18),
                  color: Colors.white,
                  letterSpacing: getHeight(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
