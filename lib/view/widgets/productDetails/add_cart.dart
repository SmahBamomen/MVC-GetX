import 'package:eco_system/logic/controllers/cart_controller.dart';
import 'package:eco_system/model/product_model.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;

   AddCart({Key? key, required this.price, required this.productModels})
      : super(key: key);
final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: [
              TextUtils(
                  text: "Price",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  underLine: TextDecoration.none),
              TextUtils(
                  text: "${price}",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(width: 20),

            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                  onPressed: () {
                    controller.addProductToCrt(productModels);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Add to Cart",style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:  Colors.white
                      ),),
                      SizedBox(width: 10),
                      Icon(Icons.shopping_cart_outlined)
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
