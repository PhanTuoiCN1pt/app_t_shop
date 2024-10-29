import 'package:app_t_shop/data/repositories/user/user_repository.dart';
import 'package:app_t_shop/features/authentication/models/user/user_model.dart';
import 'package:app_t_shop/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<void> saveUserRecord(UserCredential? userCredentials) async{
    try{
      if(userCredentials != null){
        /// Convert Name to First and Last Name
        final namePart = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        final user = UserModel(
            id: userCredentials.user!.uid,
            username: username,
            email: userCredentials.user!.email ?? '',
            firstName: namePart[0],
            lastName: namePart.length > 1 ? namePart.sublist(1).join(' ') : '' ,
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
        );

        /// Save Data
        await userRepository.saveUserRecord(user);
      }
    }catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not save',
        message: 'Something went wrong',
      );
    }

  }

}