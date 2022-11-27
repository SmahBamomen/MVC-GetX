import 'package:eco_system/logic/controllers/settings_controller.dart';
import 'package:eco_system/utils/my_string.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);
final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: languageSettings),
                child: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20),
              TextUtils(
                  text: "Language".tr,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none)
            ],
          ),
        ),
        Container(
          width: 130,
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
                color: Get.isDarkMode ? Colors.white : Colors.black, width: 2),
          ),
          child: DropdownButtonHideUnderline(

            child: DropdownButton<String>(
              value: controller.langLocal,
              onChanged: (value){
                controller.changeLanguage(value.toString());
                Get.updateLocale(Locale(value.toString()));
              },
              iconSize: 25,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              items:  [
                DropdownMenuItem(
                    value: ene,
                    child: Text(
                      english,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),

                DropdownMenuItem(
                    value: ara,
                    child: Text(
                      arabic,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),

                DropdownMenuItem(
                    value: frf,
                    child: Text(
                      france,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),

              ],
            ),
          ),
        )
      ],
    ));
  }
}
