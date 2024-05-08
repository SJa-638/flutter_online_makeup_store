import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dimesnsion.dart';

class SlideController extends GetxController {
  PageController _pageViewController = PageController(
    viewportFraction: 0.7,
  );
  var _currPagevalue = 0.0;
  double _scaleFactor = 0.8;
  var _height = getHeight(198);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // add listenser
    _pageViewController.addListener(() {
      _currPagevalue = _pageViewController.page!;
    });
    // print(_currPagevalue);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  Widget _buildPageContainer(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPagevalue.floor()) {
      var curScale = 1 - (_currPagevalue - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _currPagevalue.floor() + 1) {
      var curScale =
          _scaleFactor + (_currPagevalue - index + 1) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _currPagevalue.floor() - 1) {
      var curScale = 1 - (_currPagevalue - index) * (1 - _scaleFactor);
      var curTrans = _height * (1 - curScale) / 2;

      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var curScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, _height * (1 - curScale) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Container(
        height: getHeight(300),
        width: getWidth(150),
        color: Color(0xffC9B7B9),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(198),
      child: PageView.builder(
          controller: _pageViewController,
          itemCount: 10,
          itemBuilder: (context, index) => _buildPageContainer(index)),
    );
  }
}
