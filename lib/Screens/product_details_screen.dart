import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_online_makeup_store/controller/productcontroller.dart';
import 'package:flutter_online_makeup_store/utils/dimesnsion.dart';
import 'package:flutter_online_makeup_store/utils/nav_bar.dart';
import 'package:flutter_online_makeup_store/Widgets/app_drawer.dart';

import 'package:flutter_online_makeup_store/Models/product.dart';
import 'package:flutter_online_makeup_store/Widgets/detail page/description_container.dart';
import 'package:flutter_online_makeup_store/Widgets/detail page/detail_image_container.dart';
import 'package:flutter_online_makeup_store/Widgets/detail page/float_button.dart';
import 'package:flutter_online_makeup_store/Widgets/detail page/rating_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _productController = Get.put(ProductController());
  int? productId;
  Product? curProduct;

  @override
  void initState() {
    super.initState();
    productId = Get.arguments as int;
    //curProduct = _productController.fetchProductId(productId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCD2DB),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(
                iconFunction: () => Get.back(),
                isFav: true,
                mainIcon: Icons.arrow_back_ios,
                isMenu: false,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: getWidth(8)),
                child: Center(
                  child: Text(
                    curProduct!.name,
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
             /*  DetailImageContainer(
                curProduct: curProduct,
              ), */
              SizedBox(height: getHeight(8)),
              Container(
                height: getHeight(30),
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RatingWidget(),
                      SizedBox(
                        width: getHeight(100),
                      ),
                      Text(
                        '\$${curProduct!.price}',
                        style: TextStyle(
                          fontSize: getHeight(24),
                          fontWeight: FontWeight.w600,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getHeight(10)),
              DescriptionContainer(
                curProduct: curProduct,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatButtonContainer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}