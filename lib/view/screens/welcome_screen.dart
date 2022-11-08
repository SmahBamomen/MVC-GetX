import 'package:eco_system/routes/routes.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/screens/auth/login_screen.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [

          SizedBox(width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/images/background.png',fit: BoxFit.cover,),),
          Container(
            color: Colors.black.withOpacity(0.2),
            height: double.infinity,
            width: double.infinity,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height:100 ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: Center(
                      child:TextUtils(
                        underLine: TextDecoration.none ,
                        text: 'Welcome',
                        fontSize: 35,
                        color:Colors.white,
                        fontWeight: FontWeight.bold
                      ,)),
                ),
                SizedBox(height: 10),
                Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: Row(
                    children: [
                      TextUtils(
                          underLine: TextDecoration.none ,
                          text: 'Asroo',
                          fontSize: 35, fontWeight: FontWeight.bold, color: mainColor)

                      ,
                      SizedBox(width: 7),
                      TextUtils(
                          underLine: TextDecoration.none ,
                          text: 'Shop',
                          fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)


                    ],
                  ),
                ),
                SizedBox(height:250 ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                    onPressed: (){
Get.offNamed(Routes.loginScreen);
                    },
                    child: TextUtils(
                      underLine: TextDecoration.none ,
                      fontSize: 22,
                       fontWeight: FontWeight.bold,
                    text: 'Get Start',
                    color: Colors.white,)),
                const SizedBox(height:30 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextUtils(
                      text: "Don't have an account ?" ,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    underLine: TextDecoration.none ,
                  ),
                    TextButton(onPressed: (){

                      Get.offNamed(Routes.signUpScreen);
                    }, child:
                    TextUtils(
                      text: 'Sign Up',
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      underLine: TextDecoration.underline ,
                    ))
                ],)
              ],
            ) ,
          )
        ],
      ),
    ));
  }
}
