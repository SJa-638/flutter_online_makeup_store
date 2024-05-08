import 'package:flutter/material.dart';
import 'package:flutter_online_makeup_store/utils/dimesnsion.dart';
import 'package:flutter_online_makeup_store/widgets/app_drawer.dart';

class NavBar extends StatelessWidget {
  final Function() iconFunction;
  final bool isFav;
  final IconData mainIcon;
  final bool isMenu;

  NavBar({
    required this.iconFunction,
    required this.isFav,
    required this.mainIcon,
    this.isMenu = true,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(15),
        vertical: getHeight(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: iconFunction,
            icon: Icon(
              mainIcon,
              size: isMenu ? getHeight(32) : getHeight(25),
              color: isMenu ? Colors.black : Colors.black87,
            ),
          ),
          isFav
              ? Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: getWidth(10),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.amber,
                        size: getHeight(25),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: getHeight(28),
                      ),
                    ),
                    SizedBox(
                      width: getWidth(10),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.amber,
                        size: getHeight(25),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
