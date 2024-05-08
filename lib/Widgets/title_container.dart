import 'package:flutter/material.dart';
import 'package:flutter_online_makeup_store/utils/dimesnsion.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(60),
      child: Text(
        'find your MakeUp',
        style: TextStyle(
          fontSize: getHeight(35),
          fontFamily: 'SplineSansMono',
          letterSpacing: getWidth(0.01),
        ),
      ),
    );
  }
}
