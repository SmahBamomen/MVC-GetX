import 'package:eco_system/model/product_model.dart';
import 'package:eco_system/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favouritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
var stoarge = GetStorage();
  @override
  void onInit() {
    super.onInit();
   List? storedShoppings = stoarge.read<List>("isFavList");
    if(storedShoppings != null){
      favouritesList = storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavourites(int productID) async {
   var existingIndex =  favouritesList.indexWhere((element) => element.id == productID);
   if(existingIndex >= 0){
     favouritesList.removeAt(existingIndex);
     await stoarge.remove("isFavList");
   }
   else {
     favouritesList.add( productList.firstWhere((element) => element.id == productID));
     await stoarge.write("isFavList", favouritesList);
   }
  }
 bool isFavourites(int productID){
     return favouritesList.any((element) => element.id == productID);
 }
}
