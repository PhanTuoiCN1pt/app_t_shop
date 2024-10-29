import 'package:app_t_shop/features/authentication/screens/login/login.dart';
import 'package:app_t_shop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:app_t_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/format_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async{
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(() => const NavigationMenuScreen());
      }else{
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    } else {
      /// Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }

  }
  /*----------------------------------------- Email & Password sign-up --------------------------------------- */

  /// [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /// [MAIL VERIFICATION] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async{
    try{
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
  /// [ReAuthenticate] - ReAuthenticate User
  /// [EmailAuthentication] - FORGET PASSWORD

/*----------------------------------------- Federate identify & social sign-in --------------------------------------- */

  /// Google - Sign
  /// Facebook - Sign

/*----------------------------------------- ./end Federate identify & social sign-in --------------------------------------- */

/// [LogoutUser] - valid for authentication.
   Future<void> logout() async {
     try{
       await FirebaseAuth.instance.signOut();
       Get.offAll(() => const LoginScreen());
     } on FirebaseAuthException catch (e){
       throw TFirebaseAuthException(e.code).message;
     } on FirebaseException catch (e) {
       throw TFirebaseException(e.code).message;
     } on FormatException catch (_) {
       throw const TFormatException();
     } on PlatformException catch (e){
       throw TPlatformException(e.code).message;
     } catch (e) {
       throw 'Something went wrong, Please try again';
     }
   }
/// [DeleteUser] - Remove user Auth and Firesstore Account
}
