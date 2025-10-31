import 'package:get/get.dart';

class FavouritesController {
  RxList favouriteItems = [].obs;

  void addToFavs (Map<String, dynamic> item){
    favouriteItems.add(item);
  }

  void rmFromFavs(Map<String, dynamic> item){
    favouriteItems.remove(item);
  }
}