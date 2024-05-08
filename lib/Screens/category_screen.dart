import 'package:flutter/material.dart';
import '../datas/product_data.dart';
import '../tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final Map<String, dynamic> mockData; // Mock data to replace Firestore data
  CategoryScreen(this.mockData);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFFFF00B0),
          title: Text(
            mockData['title'],
            style: TextStyle(
              fontFamily: 'Merriweather',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            /*GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 0.65,
              ),
              itemCount: mockData['items'].length,
              itemBuilder: (context, index) {
                var data = ProductData.fromJson(mockData['items'][index]);
                return ProductTile('grid', data);
              } 
            ),
             ListView.builder(
              padding: EdgeInsets.all(4),
              itemCount: mockData['items'].length,
              itemBuilder: (context, index) {
                var data = ProductData.fromJson(mockData['items'][index]);
                return ProductTile('list', data);
              }
            ), */
          ],
        ),
      ),
    );
  }
}