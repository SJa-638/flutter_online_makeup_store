import 'package:flutter/material.dart';
import 'package:flutter_online_makeup_store/utils/dimesnsion.dart';

class CategoryScrollItem extends StatelessWidget {
  final String CategoryString;
  CategoryScrollItem({
    required this.CategoryString,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.all(getHeight(10)),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xff242424),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Center(
            child: Text(
              CategoryString,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Color(0xffC0B2B1),
              ),
            ),
          )),
    );
  }
}
