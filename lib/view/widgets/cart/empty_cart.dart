import 'package:eco_system/routes/routes.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
            size: 150,
            color:Get.isDarkMode? Colors.white: Colors.black,
          ),
          const SizedBox(height: 40),
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: "Your Cart is",
                style: TextStyle(
                  color:Get.isDarkMode? Colors.white: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                )
              ),

              TextSpan(
                  text: " Empty",
                  style: TextStyle(
                      color:Get.isDarkMode? pinkClr: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  )
              ),
            ]
          )),
        const  SizedBox(height:10 ),
          Text("Add items to get started",style: TextStyle(
              color:Get.isDarkMode? Colors.white: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15
          )),
          SizedBox(height: 50),
          SizedBox(
            height: 50,
            child: ElevatedButton(
style: ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  elevation: 0,
  primary: Get.isDarkMode ? pinkClr : mainColor
),
                onPressed: (){
                  Get.toNamed(Routes.mainScreen);
                },
                child: const Text("Go to Home",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,

                ),)),
          )
        ],
      ),
    );
  }
}
