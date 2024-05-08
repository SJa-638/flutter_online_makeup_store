import 'package:get/get.dart';
import 'package:flutter_online_makeup_store/services/remoteservices.dart';

import '../models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var Products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    var products = await RemoteServices.fetchProducts();
    // print(products![1].imageLink);
    // print(products[1].id);
    return Products.value = products!;
  }

  Product fetchProductId(int id) {
    Product product = Products.firstWhere((prod) => prod.id == id);
    return product;
  }
}
