/* import 'product_data.dart';

class CartProduct {
  String cartId;
  String category;
  String productId;
  String size;
  int quantity;
  ProductData productData;

  CartProduct({
    this.cartId,
    this.category,
    this.productId,
    this.size,
    this.quantity,
    this.productData,
  });

  CartProduct.fromMap(Map<String, dynamic> map) {
    category = map['category'];
    productId = map['productId'];
    size = map['size'];
    quantity = map['quantity'];
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'productId': productId,
      'size': size,
      'quantity': quantity,
      'product': productData.toMap(),
    };
  }
} */