import 'package:eco_system/logic/controllers/auth_controller.dart';
import 'package:eco_system/logic/controllers/theme_controller.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);
   final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: (){
             ThemeController().changeTheme();

              },
                child: Text("Dark Mode ",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black
                ),)),
SizedBox(height: 20),
           GetBuilder<AuthController>(builder:(_){
             return TextButton(
                 onPressed: (){
                   Get.defaultDialog(
                     title: "Logout From App",
                     titleStyle: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: Colors.black
                     ),
                     middleText: 'Are yiiy sure you need to logout ',
                     middleTextStyle: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: Colors.black
                     ),
                     backgroundColor: Colors.grey,
                     radius: 10,
                     textCancel: " No",
                     cancelTextColor: Colors.black,

                     textConfirm: " Yes",
                     confirmTextColor: Colors.black,
                     onCancel: (){
                       Get.back();
                     },
                     onConfirm: (){
                       controller.signOutFirebase();
                     },
                     buttonColor: Get.isDarkMode ? pinkClr:mainColor,

                   );


                 },
                 child: Text("Log Out ",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black
                 ),));
           })
          ],
        ),
      ),
    );
  }
}
