import 'package:eco_system/logic/controllers/auth_controller.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LogOutWidget extends StatelessWidget {
   LogOutWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) =>  Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Get.isDarkMode ? Colors.pink :Colors.green[100],
          borderRadius: BorderRadius.circular(12),
          customBorder: StadiumBorder(),
          onTap: (){
            Get.defaultDialog(
              title: "Logout From App",
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
              middleText: 'Are you sure you need to logout ',
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
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: logOutSettings
                ),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),

              ),
              SizedBox(width: 20),
              TextUtils(
                  text: "Logout".tr,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color:Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none)
            ],
          ),
        ),
      ),
    );
  }


}
