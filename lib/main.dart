import 'package:eco_system/language/localiztion.dart';
import 'package:eco_system/logic/controllers/theme_controller.dart';
import 'package:eco_system/routes/routes.dart';
import 'package:eco_system/utils/my_string.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(GetStorage().read<String>('lang').toString()),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
      title: 'Asroo Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser 
          != null 
          || GetStorage().read<bool>("auth") == true ? AppRoutes.mainScreen : AppRoutes.welcome ,
      getPages: AppRoutes.routes,
    );
  }
}
