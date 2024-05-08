import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {
  final Map<String, dynamic> data;
  
  PlaceTile(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 300,
            child: Image.network(
              data['image'],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['title'],
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFFF00B0),
                  ),
                ),
                Text(
                  data['address'],
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFFF00B0),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 8.0,
              width: double.maxFinite,
              child: Divider(
                height: 4,
                color: Color(0XFFFCD2DB),
                indent: 50,
                endIndent: 50,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0XFFFF00B0),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  launch(
                    'https://www.google.com/maps/search/?api=1&query=${data['lat']},${data['long']}');
                },
                child: Text(
                  'View on Map',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFFF00B0),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0XFFFF00B0),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  launch('tel:${data['phone']}');
                },
                child: Text(
                  'Call',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFFF00B0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}