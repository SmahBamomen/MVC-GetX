
import 'package:eco_system/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(ProductController());
  }
}