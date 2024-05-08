import 'package:flutter/material.dart';
import 'package:flutter_online_makeup_store/controller/productcontroller.dart';
import 'package:flutter_online_makeup_store/utils/dimesnsion.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final String price;
  final String imageLink;
  ProductItem({
    required this.imageLink,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
//     return Container(
//       height: getHeight(200),
//       color: Colors.black,
//     );
//   }
// }
    return Container(
      height: getHeight(200),
      width: getWidth(200),
      child: Card(
        child: GridTile(
          footer: Container(
            color: Colors.black54,
            height: getHeight(40),
            child: Center(
              child: ListTile(
                trailing: Text(
                  '\$$price',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getHeight(20),
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    getHeight(10),
                  ),
                ),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_rounded,
                    color: Color(0xFFFF00B0),
                    size: getHeight(20),
                  ),
                ),
              ),
            ),
          ),
          child: Image.network(
            imageLink,
            fit: BoxFit.cover,
          ),
        ),
        elevation: getHeight(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getHeight(10),
          ),
        ),
      ),
    );
  }
}
