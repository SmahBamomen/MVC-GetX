import 'package:badges/badges.dart';
import 'package:eco_system/logic/controllers/cart_controller.dart';
import 'package:eco_system/logic/controllers/main_controller.dart';
import 'package:eco_system/routes/routes.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
final controller = Get.find<MainController>();
   final cartController = Get.find<CartController>();
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
         Obx(() {
           return    Badge(
           position: BadgePosition.topEnd(top: 0, end: 3),
           animationDuration: Duration(milliseconds: 300),
           animationType: BadgeAnimationType.slide,
           badgeContent: Text(
             cartController.quantity().toString(),
           style: TextStyle(color: Colors.white),
           ),
           child: IconButton(icon: Image.asset('assets/images/shop.png'), onPressed: () {
           Get.toNamed(Routes.cartScreen);
           }),
           );
         })

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
