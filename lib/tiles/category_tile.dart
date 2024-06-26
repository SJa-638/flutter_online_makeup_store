import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final Map<String, dynamic> data;
  CategoryTile(this.data);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(data['icon']),
      ),
      title: Text(
        data['title'],
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey[800],
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right_rounded, size: 28),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryScreen(data as Map<String, dynamic>),
          ),
        );
      },
    );
  }
}