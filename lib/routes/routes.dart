import 'package:eco_system/logic/bingings/auth_binding.dart';
import 'package:eco_system/logic/bingings/main_binding.dart';
import 'package:eco_system/logic/bingings/product_binding.dart';
import 'package:eco_system/view/screens/auth/cart_screen.dart';
import 'package:eco_system/view/screens/auth/forget_password_screen.dart';
import 'package:eco_system/view/screens/auth/login_screen.dart';
import 'package:eco_system/view/screens/auth/main_screen.dart';
import 'package:eco_system/view/screens/signup_screen.dart';
import 'package:eco_system/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgetPasswordScreen,
        page: () => ForgetPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.mainScreen,
        page: () => MainScreen(),
        bindings: [AuthBinding(), MainBinging(), ProductBinding()]),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [AuthBinding(), ProductBinding()],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
