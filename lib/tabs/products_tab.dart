import 'package:flutter/material.dart';
import '../tiles/category_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulated data to replace Firestore logic
    // Example: a list of dummy product data
    List<Map<String, dynamic>> dummyProductData = [
      {
        'productId': '1',
        'productName': 'Product A',
        'category': 'Category 1',
      },
      {
        'productId': '2',
        'productName': 'Product B',
        'category': 'Category 2',
      },
      // Add more dummy product data as needed
    ];

    // Simulate the asynchronous behavior with a Future.delayed
    return FutureBuilder<void>(
      future: Future.delayed(Duration(seconds: 1)), // Simulate asynchronous delay
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var dividedTiles = ListTile.divideTiles(
            context: context,
            tiles: dummyProductData
                .map((data) => CategoryTile(data))
                .toList(),
            color: Colors.grey[800],
          ).toList();
          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }
}