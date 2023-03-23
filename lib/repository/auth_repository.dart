import 'package:peptask/service/firestore_service.dart';

import '../model/user_model.dart';
import '../service/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  Future<UserModel?> signIn(UserModel userModel) async {
    //bu fonksiyon sadece aktarma yapıyor
    UserModel? signedUser = await _authService.signIn(userModel);
    if (signedUser != null) {
      return await _firestoreService.signIn(signedUser.id);
    }
  }

  Future<UserModel?> signUp(UserModel userModel) async {
    UserModel? savedUser = await _authService.signUp(userModel);

    if (savedUser != null) {
      return await _firestoreService.signUp(userModel);
    }
  }

  Future<UserModel?> signOut() async {
    return await _authService.signOut();
  }

  currentUser() async {
    return await _authService.currentUser();
  }
}
