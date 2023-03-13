import '../model/user_model.dart';
import '../service/auth_service.dart';

class AuthRepository {
  final AuthService _service = AuthService();

  Future<UserModel?> signIn(UserModel userModel) async {
    return await _service.signIn(userModel);
  }

  Future<UserModel?> signUp(UserModel userModel) async {
    return await _service.signUp(userModel);
  }

  Future<UserModel?> signOut() async {
    return await _service.signOut();
  }

  currentUser() async {
    return await _service.currentUser();
  }
}
