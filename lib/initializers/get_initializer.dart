import 'package:get/get.dart';
import 'package:phanstore/controllers/CartController.dart';

class GetInit{

  static void initializeControllers (){
    Get.put(CartController());
  }
}