import 'package:app_t_shop/data/repositories/user/user_repository.dart';
import 'package:app_t_shop/features/authentication/screens/login/login.dart';
import 'package:app_t_shop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:app_t_shop/features/authentication/screens/signup/verify_email.dart';
import 'package:app_t_shop/navigation_menu.dart';
import 'package:app_t_shop/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/format_exceptions.dart';
import 'package:app_t_shop/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// GetAuthentication User Data
  User? get authUser => _auth.currentUser;

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
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async{
    try{
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
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

  /// [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
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

/*----------------------------------------- Federate identify & social sign-in --------------------------------------- */

  /// Google - Sign
  Future<UserCredential?> signInWithGoogle() async{
    try{

      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e){
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    } catch (e) {
      if(kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /// Facebook - Sign

/*----------------------------------------- ./end Federate identify & social sign-in --------------------------------------- */

/// [LogoutUser] - valid for authentication.
   Future<void> logout() async {
     try{
       await GoogleSignIn().signOut();
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
   Future<void> deleteAccount() async {
     try{
       await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
       await _auth.currentUser?.delete();
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
}
