import 'package:flutter/material.dart';
import '../tiles/place_tile.dart'; // Assuming this is a custom widget for displaying place details

class PlacesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder list of place data
    List<Map<String, dynamic>> placeData = [
      {
        'name': 'Place 1',
        'description': 'Description of Place 1',
      },
      {
        'name': 'Place 2',
        'description': 'Description of Place 2',
      },
      // Add more place data as needed
    ];

    return ListView.builder(
      itemCount: placeData.length,
      itemBuilder: (context, index) {
        return PlaceTile(placeData[index]); // Passing each place data to the custom PlaceTile widget
      },
    );
  }
}