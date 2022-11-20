import 'package:eco_system/view/screens/auth/category_screen.dart';
import 'package:eco_system/view/screens/auth/favorites_screen.dart';
import 'package:eco_system/view/screens/auth/settings_screen.dart';
import 'package:eco_system/view/screens/home_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
RxInt currentIndex =0.obs;
final tabs = [
  HomeScreen(),
  CategoryScreen(),
  FavoriateScreen(),
  SettingScreen(),
].obs;

final title = [
  "Asroo Shop",
  "Categories",
  "Favourites",
  "Setting"
].obs;
}