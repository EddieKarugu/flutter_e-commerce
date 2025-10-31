import 'package:get/get.dart';
import 'package:phanstore/controllers/CartController.dart';
import 'package:phanstore/controllers/favourites_controller.dart';
import 'package:phanstore/controllers/wishlist_controller.dart';

class GetInit{

  static void initializeControllers (){
    Get.put(CartController());
    Get.put(FavouritesController());
    Get.put(WishlistController());
  }
}