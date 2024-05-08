/* import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../datas/cart_product.dart';
import 'user_model.dart';

class CartModel extends Model {
  UserModel user;
  List<CartProduct> products = [];
  String couponCode = '';
  int discountPercentage = 0;
  bool isLoading = false;

  CartModel(this.user) {
    if (user.isLoggedIn) {
      _loadCartItem();
    }
  }

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void addCartItem(CartProduct cartProduct) {
    products.add(cartProduct);
    // Placeholder for adding to cart (replace with actual logic)
    notifyListeners();
  }

  void removeCartItem(CartProduct cartProduct) {
    products.remove(cartProduct);
    // Placeholder for removing from cart (replace with actual logic)
    notifyListeners();
  }

  void decProduct(CartProduct cartProduct) {
    cartProduct.quantity--;
    // Placeholder for decreasing product quantity (replace with actual logic)
    notifyListeners();
  }

  void incProduct(CartProduct cartProduct) {
    cartProduct.quantity++;
    // Placeholder for increasing product quantity (replace with actual logic)
    notifyListeners();
  }

  void setCoupon(String couponCode, int discountPercentage) {
    this.couponCode = couponCode;
    this.discountPercentage = discountPercentage;
  }

  void updatePrice() {
    notifyListeners();
  }

  double getProductPrice() {
    var price = 0.0;
    for (var subprice in products) {
      if (subprice.productData != null) {
        price += subprice.quantity * subprice.productData.price;
      }
    }
    return price;
  }

  double getDiscount() {
    return getProductPrice() * discountPercentage / 100;
  }

  double getShipPrice() {
    return 0.00; // Placeholder for shipping price (replace with actual logic)
  }

  Future<String> finishOrder() async {
    if (products.isEmpty) return '';
    
    // Placeholder for finishing order (replace with actual logic)
    
    isLoading = false;
    products.clear();
    couponCode = '';
    discountPercentage = 0;
    notifyListeners();
    return '123'; // Placeholder for returning order ID
  }

  void _loadCartItem() {
    // Placeholder for loading cart items (replace with actual logic)
  }
} */