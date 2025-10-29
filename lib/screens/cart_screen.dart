import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanstore/controllers/CartController.dart';
import 'package:phanstore/widgets/cart_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isWideScreen = screenSize.width > 600;
    final bool isTabletScreen =
        screenSize.width > 400 && screenSize.width < 850;

    CartController cartController = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: Obx(
        () => cartController.cartItems.isEmpty
            ? Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : isWideScreen
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTabletScreen? 2 : 3,
                  childAspectRatio: isTabletScreen? 2.1 :2.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
                itemBuilder: (context, index) {
                  return CartContainer(carted: cartController.cartItems[index]);

                }, itemCount: cartController.cartItems.length,
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return CartContainer(carted: cartController.cartItems[index]);
                },
                itemCount: cartController.cartItems.length,
              ),
      ),
    );
  }
}
