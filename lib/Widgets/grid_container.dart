import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:flutter_online_makeup_store/utils/dimesnsion.dart';
import 'package:flutter_online_makeup_store/widgets/product_grid.dart';

import '../controller/productcontroller.dart';

class GridContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _productController = Get.put(ProductController());
    final productsList = _productController.Products;
    return FutureBuilder(
      future: _productController.fetchProducts(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: getHeight(3),
                      crossAxisSpacing: getWidth(3),
                    ),
                    itemBuilder: (context, i) => Obx(
                      () => ProductItem(
                        imageLink: productsList[i].imageLink,
                        price: productsList[i].price,
                      ),
                    ),
                    itemCount: productsList.length,
                  ),
                ),
    );
  }
}

Widget _buildStaggerGrid(BuildContext context, int i) {
  return StaggeredGridTile.fit(
    crossAxisCellCount: 2,
    child: Obx(
      () => ProductItem(
        imageLink: Get.find<ProductController>().Products[i].imageLink,
        price: Get.find<ProductController>().Products[i].price,
      ),
    ),
  );
}
