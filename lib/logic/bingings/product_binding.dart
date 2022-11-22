
import 'package:eco_system/logic/controllers/cart_controller.dart';
import 'package:eco_system/logic/controllers/category_controller.dart';
import 'package:eco_system/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}