import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary:Get.isDarkMode ?  mainColor:pinkClr,
            minimumSize: const Size(360,50)),
        onPressed: onPressed,
        child: TextUtils(
          color: Colors.white,
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          underLine: TextDecoration.none,
        ));
  }
}
