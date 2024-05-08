import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_online_makeup_store/controller/productcontroller.dart';
import 'package:flutter_online_makeup_store/utils/pageview_container.dart';

import 'dimesnsion.dart';

class PageViewContainer extends StatefulWidget {
  final double pageHeight;
  PageViewContainer({
    required this.pageHeight,
  });
  @override
  State<PageViewContainer> createState() => _PageViewContainerState();
}

class _PageViewContainerState extends State<PageViewContainer> {
  // // controllers
  final _productController = Get.put(ProductController());
  final PageController _pageViewController = PageController(
    viewportFraction: 0.7,
  );
  var _currPagevalue = 0.0;
  double _scaleFactor = 0.7;
  var _height = getHeight(198);
  @override
  void initState() {
    // TODO: implement ianitState
    super.initState();
    // add listenser
    _pageViewController.addListener(() {
      setState(() {
        _currPagevalue = _pageViewController.page!;
        // print(_currPagevalue);
      });
    });
    @override
    void dispose() {
      super.dispose();
      _pageViewController.dispose();
    }
  }

  Widget _buildPageContainer({
    required int index,
    required String imageLink,
    required String price,
    required String name,
    required int productId,
  }) {
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
      child: PageviewContainer(
        containerHeight: 300,
        containerWidth: 100,
        imageLink: imageLink,
        productName: name,
        productPrice: price,
        id: productId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getHeight(widget.pageHeight),
        child: Obx(
          () => PageView.builder(
            controller: _pageViewController,
            itemCount: _productController.Products.length,
            itemBuilder: (context, index) => _buildPageContainer(
              index: index,
              imageLink: _productController.Products[index].imageLink,
              price: _productController.Products[index].price,
              name: _productController.Products[index].name,
              productId: _productController.Products[index].id,
            ),
          ),
        ));
  }
}
