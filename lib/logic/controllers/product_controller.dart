
import 'package:eco_system/model/product_model.dart';
import 'package:eco_system/services/product_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
var productList = <ProductModels>[].obs;
var isLoading = true.obs;

@override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {

   var products = await ProductServices.getProduct();
   try {
     isLoading(true);
     if(products.isNotEmpty){
       productList.addAll(products);
     }
   } finally{
isLoading(false);
   }
  }
}