import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../utils/dimesnsion.dart';

class DetailImageContainer extends StatelessWidget {
  DetailImageContainer({
    Key? key,
    required this.curProduct,
  });

  final Product? curProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(
          getHeight(10),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            curProduct!.imageLink,
          ),
        ),
      ),
    );
  }
}
