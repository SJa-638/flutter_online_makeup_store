import 'package:flutter/material.dart';
import 'package:flutter_online_makeup_store/Screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins', textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.white), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Color(0xffF8F2F2)),
      ),
      home: HomeScreen(),
    );
  }
}
