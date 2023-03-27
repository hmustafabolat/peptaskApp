import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peptask/view/user_home.dart';
import 'package:peptask/view/login_page.dart';
import 'package:peptask/viewmodel/auth_viewmodel.dart';
import 'package:peptask/viewmodel/permission_viewmodel.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final AuthViewModel _authViewModel = Get.find();
  final PermissionViewModel _permissionViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_authViewModel.userModel.value?.id == null) {
        return UserLoginPage();
      } else {
        return UserMainPage();
      }
    });
  }
}
