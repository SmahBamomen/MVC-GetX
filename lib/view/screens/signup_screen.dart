import 'package:eco_system/logic/controllers/auth_controller.dart';
import 'package:eco_system/routes/routes.dart';
import 'package:eco_system/utils/my_string.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/auth/auth_button.dart';
import 'package:eco_system/view/widgets/auth/auth_text_form_Field.dart';
import 'package:eco_system/view/widgets/auth/check_widget.dart';
import 'package:eco_system/view/widgets/auth/container_under.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                text: "SIGN",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                underLine: TextDecoration.none),
                            SizedBox(width: 3),
                            TextUtils(
                                text: "UP",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                underLine: TextDecoration.none),
                          ],
                        ),
                        SizedBox(height: 50),
                        AuthTextFormField(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return "Enter valid name";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/user.png')
                              : Icon(
                                  Icons.person,
                                  color: Colors.pink,
                                  size: 30,
                                ),
                          suffixIcon: const Text(""),
                          hintText: "User Name",
                        ),
                        const SizedBox(height: 20),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return "Invalid email";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/email.png')
                              : Icon(
                                  Icons.email,
                                  color: Colors.pink,
                                  size: 30,
                                ),
                          suffixIcon: const Text(""),
                          hintText: "Email",
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                            controller: passwordController,
                            obscureText: controller.isVisibility ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return "Password should be longer or equal 6 characters";
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/lock.png')
                                : Icon(
                                    Icons.lock,
                                    color: Colors.pink,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                            hintText: "Password",
                          );
                        }),
                        SizedBox(height: 50),
                        CheckWidget(),
                        SizedBox(height: 50),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: "Sign Up",
                            onPressed: () {
                              if (controller.isCheckBox == false) {
                                Get.snackbar("Check Box",
                                    "Please , Accept terms & conditions",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                              } else if (formKey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;

                                controller.signUpFirebase(
                                    name: name,
                                    email: email,
                                    password: password);
                                controller.isCheckBox = true;
                              }

                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an account ? ',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                textType: "Log in",
              )
            ],
          ),
        ),
      ),
    );
  }
}
