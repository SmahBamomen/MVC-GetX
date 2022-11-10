import 'package:eco_system/logic/controllers/auth_controller.dart';
import 'package:eco_system/utils/my_string.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/auth/auth_button.dart';
import 'package:eco_system/view/widgets/auth/auth_text_form_Field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({Key? key}) : super(key: key);
final formKey = GlobalKey<FormState>();
   final TextEditingController emailController = TextEditingController();
   final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor:  Get.isDarkMode ? Colors.white : darkGreyClr,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white:darkGreyClr,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back,color:  Get.isDarkMode ? Colors.black:Colors.white,),
        ),
        title: Text('Forgot Password',style: TextStyle(color: Get.isDarkMode ? mainColor:pinkClr,),),
      ),
body: Form(
  key: formKey,
  child: SingleChildScrollView(

    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.close_rounded,color: Colors.white,),
            ),
          ),
          const SizedBox(height: 20),
          Text("if you want to recover your account , then please provide your email ID below ..",
            textAlign: TextAlign.center,
            style: TextStyle(

              color: Get.isDarkMode?  Colors.black : Colors.white,

            ),),
          const SizedBox(height: 50),
          Image.asset("assets/images/forgetpass copy.png",width: 250,),
          const  SizedBox(height: 50),
          AuthTextFormField(
            controller: emailController,
            obscureText: false,
            validator: (value) {
              if(!RegExp(validationEmail).hasMatch(value)){
                return "Invalid email";

              }
              else {
                return null;
              }
            },
            prefixIcon:Get.isDarkMode ?  Image.asset('assets/images/email.png'):Icon(Icons.email,color: Colors.pink,size: 30,),
            suffixIcon: const Text(""),
            hintText: "Email",
          ),
          const  SizedBox(height: 50),
        GetBuilder<AuthController>(builder: (_){
         return AuthButton(text: "SEND", onPressed: (){
           if(formKey.currentState!.validate()){
             String email = emailController.text.trim();
             controller.resetPasswordFirebase(email);
           }

          });
        })

        ],
      ),
    ),
  ),

),
    )
    );
  }
}
