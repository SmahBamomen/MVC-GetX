import 'package:eco_system/language/ar.dart';
import 'package:eco_system/language/en.dart';
import 'package:eco_system/language/fr.dart';
import 'package:eco_system/utils/my_string.dart';
import 'package:get/route_manager.dart';


class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    ene: en,
    ara: ar,
    frf: fr,
  };
}
