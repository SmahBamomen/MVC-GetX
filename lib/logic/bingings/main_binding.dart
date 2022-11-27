

import 'package:eco_system/logic/controllers/main_controller.dart';
import 'package:eco_system/logic/controllers/settings_controller.dart';
import 'package:get/instance_manager.dart';

class MainBinging extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.lazyPut(() => SettingController());

  }


}