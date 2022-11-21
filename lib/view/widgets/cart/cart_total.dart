import 'package:eco_system/logic/controllers/cart_controller.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
   CartTotal({Key? key}) : super(key: key);
final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: "Total",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    underLine: TextDecoration.none),
                Text(
                  "\$${controller.total}",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5),
                ),
              ],
            ),
            const SizedBox(width: 20),
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
                    onPressed: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Check Out",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                        SizedBox(width: 10),
                        Icon(Icons.shopping_cart)
                      ],
                    )),
              ),
            )

          ],
        ),
      );
    });
  }
}
