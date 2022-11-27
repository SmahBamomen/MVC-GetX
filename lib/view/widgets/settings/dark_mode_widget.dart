import 'package:eco_system/logic/controllers/settings_controller.dart';
import 'package:eco_system/logic/controllers/theme_controller.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DarkModeWidget extends StatelessWidget {
   DarkModeWidget ({Key? key}) : super(key: key);
final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context){

   return Obx(
           () =>  Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       buildIconWidget(),
       Switch(
           value: controller.switchValue.value,
           activeColor: Get.isDarkMode ? pinkClr : mainColor,
           activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,

           onChanged: (value){
             ThemeController().changeTheme();
             controller.switchValue.value = value;
           })
     ],
   ));
  }
  Widget buildIconWidget(){
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings
            ),
            child: Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),

          ),
          SizedBox(width: 20),
          TextUtils(
              text: "Dark Mode".tr,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color:Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.none)
        ],
      ),
    );
  }
}
