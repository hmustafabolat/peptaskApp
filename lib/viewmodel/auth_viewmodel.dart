import 'package:get/get.dart';

import '../model/user_model.dart';
import '../repository/auth_repository.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _repository = Get.find();
  final Rx<UserModel?> userModel = UserModel().obs;

  @override
  onInit() async {
    super.onInit();

    await currentUser();
  }

  Future<UserModel?> signIn(UserModel user) async {
    userModel.value = (await _repository.signIn(user))!;
  }

  Future signUp(UserModel user) async {
    await _repository.signUp(user);
  }

  Future signOut() async {
    userModel.value = (await _repository.signOut())!;
  }

  Future currentUser() async {
    userModel.value = await _repository.currentUser();
  }
}
