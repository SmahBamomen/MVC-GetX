import 'package:eco_system/logic/controllers/main_controller.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() {
          return Scaffold(
            backgroundColor:  context.theme.backgroundColor,
            //backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
            appBar: AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.isDarkMode ?
                      Get.changeThemeMode(ThemeMode.light) :
                      Get.changeThemeMode(ThemeMode.dark);

                    }, icon: Image.asset('assets/images/shop.png'))
              ],
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              title: Text(controller.title[controller.currentIndex.value]),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Get.isDarkMode ? darkGreyClr :Colors.white,

              items: [
                BottomNavigationBarItem(
                    activeIcon:
                    Icon(Icons.home, color: Get.isDarkMode ? pinkClr : mainColor),
                    label: '',
                    icon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    )),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.category,
                        color: Get.isDarkMode ? pinkClr : mainColor),
                    label: '',
                    icon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    )),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.favorite,
                        color: Get.isDarkMode ? pinkClr : mainColor),
                    label: '',
                    icon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    )),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.settings,
                        color: Get.isDarkMode ? pinkClr : mainColor),
                    label: '',
                    icon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    )),
              ],
              onTap: (int index){
controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        }));
  }
}
