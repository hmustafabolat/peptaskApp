import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peptask/view/admin_main_page.dart';
import 'package:peptask/view/login_page.dart';
import 'package:peptask/view/register_page.dart';
import 'package:peptask/view/request_accept_page.dart';
import 'package:peptask/viewmodel/auth_viewmodel.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final AuthViewModel _authViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print("şuanki tarih = ${DateTime.now().millisecondsSinceEpoch}");
      print("LandingPage user = ${_authViewModel.userModel.value?.toJson()}");
      if (_authViewModel.userModel.value?.id == null) {
        return UserLoginPage();
      } else {
        return RequestAcceptPage();
      }
    });
  }
}
