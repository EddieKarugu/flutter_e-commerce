import 'package:get/get.dart';

class WishlistController {
  RxList wishListItems = [].obs;

  void addToWished(Map<String, dynamic> item){
    wishListItems.add(item);
  }

  void rmFromWished(Map<String, dynamic> item){
    wishListItems.remove(item);
  }
}