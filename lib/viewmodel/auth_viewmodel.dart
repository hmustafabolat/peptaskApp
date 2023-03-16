import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';
import '../repository/auth_repository.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _repository = Get.find();
  final Rx<UserModel?> userModel = UserModel().obs;

  @override
  onInit() async {
    super.onInit();
firebaseTest();
    await currentUser();
  }

  firebaseTest(){
    debugPrint("firebasee test ");
    FirebaseFirestore.instance.collection("test").add({"data":"test data"});
  }

  Future<UserModel?> signIn(UserModel user) async {
    UserModel? userData = await _repository.signIn(user);
    debugPrint("userData = ${userData?.toJson().toString()}");
    userModel.value = userData;
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
