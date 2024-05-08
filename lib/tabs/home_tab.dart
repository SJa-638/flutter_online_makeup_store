import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFF00B0),
            Color(0XFFFCD2DB),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );

    // Mock data instead of Firestore data
    // Replace this with your actual implementation using a local data source
    List<Map<String, dynamic>> mockData = [
      {'image': 'assets\images\WhatsApp Image 2024-05-07 at 14.57.12_80f144a2.jpg', 'x': 1, 'y': 1}, // Example data
      {'image': 'assets\images\WhatsApp Image 2024-05-07 at 14.57.13_31835636.jpg', 'x': 2, 'y': 2}, // Example data
    ];

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  '@Glow_Essentials',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final data = mockData[index];
                  return FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: data['image'],
                    fit: BoxFit.cover,
                  );
                },
                childCount: mockData.length,
              ),
            ),
          ],
        ),
      ],
    );
  }
}