import 'package:eco_system/model/facebook_model.dart';
import 'package:eco_system/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FaceBookModel? faceBookModel;
  var isSignIn = false ;
  User? get userProfiloe => auth.currentUser;
  final GetStorage authBox = GetStorage();
  var googleSignIn = GoogleSignIn(
      clientId: 'apps.googleusercontent.com.278843445249-g1303jt82jao41jf9204ha9ite3bq403'

    //  clientId: '278843445249-g1303jt82jao41jf9204ha9ite3bq403.apps.googleusercontent.com'
  );
  @override
  void onInit() {
    displayUserName.value =
    (userProfiloe != null ? userProfiloe!.displayName : "")!;
    displayUserPhoto.value.isEmpty ? "" :
    (userProfiloe != null ? userProfiloe!.photoURL : "")!;

    displayUserEmail.value = (userProfiloe != null ? userProfiloe!.email : "")!;

    super.onInit();
  }
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      isSignIn = true;
      authBox.write('auth', isSignIn);
      update();

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('_'), '').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void logInFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
      displayUserName.value = auth.currentUser!.displayName!);

      isSignIn = true;
      authBox.write("auth", isSignIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
        ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
  void googleSignInFirebase() async {

    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;
      isSignIn = true;
      authBox.write('auth', isSignIn);
      update();
      Get.offNamed(Routes.mainScreen);
    }
    catch (e){
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      print(e.toString());
    }
    // googleSignIn.signOut();
    // auth.signOut();
  }
  void facebookSignInFirebase() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
   if(loginResult.status == LoginStatus.success){
     final data = await FacebookAuth.instance.getUserData();
     faceBookModel = FaceBookModel.fromJson(data) ;
     isSignIn = true;
     authBox.write('auth', isSignIn);
     update();
     Get.offNamed(Routes.mainScreen);
   }


  }
  void resetPasswordFirebase(String email) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('_'), '').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message =
            'Account does not exists for that $email .. Create your account by signing up..';
      }
      {
        message = e.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  void signOutFirebase() async {
    try {
  await auth.signOut();
  await googleSignIn.signOut();

   await FacebookAuth.i.logOut();
   displayUserName.value = '';
   displayUserPhoto.value = '';
  isSignIn = false;
  authBox.remove("auth");

   update();
  Get.offNamed(Routes.welcomeScreen);
    } catch(e){
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }


  }
}
