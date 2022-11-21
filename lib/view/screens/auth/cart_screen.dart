
import 'package:eco_system/logic/controllers/cart_controller.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/cart/cart_product_card.dart';
import 'package:eco_system/view/widgets/cart/cart_total.dart';
import 'package:eco_system/view/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text('Cart Items'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr:mainColor,
actions: [IconButton(onPressed: (){
  controller.clearAllProducts();
}, icon:const Icon(Icons.backspace))],
      ),
      body: Obx(() {
        if(controller.productMap.isEmpty){
          return const EmptyCart();
        }
        else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.separated(
                      itemBuilder: (context,index){
                        return CartProductCard(
                            quantity: controller.productMap.values.toList()[index],
                            index: index,
                            productModels: controller.productMap.keys.toList()[index]);
                      },
                      separatorBuilder: (context,index) => SizedBox(height: 20,),
                      itemCount: controller.productMap.length),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child:  CartTotal()),

              ],
            ),
          );
        }

      }),
    ),
    );
  }

}
