import 'package:flutter/material.dart';
import 'package:flutter_online_makeup_store/utils/dimesnsion.dart';
import 'package:flutter_online_makeup_store/utils/nav_bar.dart';
import 'package:flutter_online_makeup_store/widgets/app_drawer.dart';
import 'package:flutter_online_makeup_store/widgets/detail%20page/categoryscroll_view.dart';
import 'package:flutter_online_makeup_store/widgets/grid_container.dart';

import '../utils/pageviewAmination.dart';
import '../widgets/title_container.dart';

class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _iconFunction() => _scaffoldKey.currentState!.openDrawer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFFCD2DB),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavBar(
              iconFunction: _iconFunction,
              isFav: false,
              mainIcon: Icons.menu,
            ),
            SizedBox(
              height: getHeight(10),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getWidth(15),
              ),
              child: TitleContainer(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getWidth(15),
              ),
              child: CategoryScrollView(),
            ),
            SizedBox(
              height: getHeight(40),
            ),
            Visibility(
              child: PageViewContainer(
                pageHeight: 300,
              ),
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
