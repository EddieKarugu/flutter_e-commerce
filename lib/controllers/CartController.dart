import 'package:get/get.dart';

class CartController extends GetxController {
  List cartItems = [].obs;

  void addToCart(Map<String, dynamic> item) {
    cartItems.add(item);
  }

  void removeFromCart(Map<String, dynamic> item) {
    cartItems.remove(item);
  }
}
