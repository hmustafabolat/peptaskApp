import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../repository/auth_repository.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _repository = Get.find();
  final Rx<UserModel?> userModel = UserModel().obs;

  final signInFormGlobalKey = GlobalKey<FormState>();
  final signUpFormGlobalKey = GlobalKey<FormState>();
  String? name, email, password;

  Future<UserModel?> signIn() async {
    if (signInFormGlobalKey.currentState!.validate()) {
      signInFormGlobalKey.currentState!.save();

      userModel.value =
          await _repository.signIn(UserModel(email: email, password: password));
    }
  }

  Future signUp(UserModel user) async {
    await _repository.signUp(user);
    if (signUpFormGlobalKey.currentState!.validate()) {
      signUpFormGlobalKey.currentState!.save();

      var result = await _repository.signUp(UserModel(
        email: email,
        password: password,
        name: name,
      ));
      Get.back();
    }
  }

  Future signOut() async {
    userModel.value = (await _repository.signOut())!;
  }

  Future currentUser() async {
    userModel.value = await _repository.currentUser();
  }
}
