import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peptask/model/permission_model.dart';
import 'package:peptask/service/permission_service.dart';
import 'package:peptask/view/request_accept_page.dart';
import 'package:peptask/viewmodel/auth_viewmodel.dart';

import '../storage.dart';

class PermissionViewModel extends GetxController {
  final AuthViewModel _authViewModel = Get.find();
  final PermissionProvider _permissionProvider = PermissionProvider();
  final PermissionService _permissionService = PermissionService();

  final permissionFormGlobalKey = GlobalKey<FormState>();
  String? description = "", permissionType = " ", status = "";
  DateTime permissionStart = DateTime.now(), permissionEnd = DateTime.now();

  PermissionModel? myPermission;
  List<PermissionModel> allPermissions = [];
  getAllPermission() async {
    _permissionProvider.getAllPermission(_authViewModel.userModel.value?.id);

    var result = await _permissionProvider
        .getAllPermission(_authViewModel.userModel.value?.id);
    log(result[0].description.toString());

    if (result != null) {
      myPermission = result[1];
      allPermissions = result;
      print('myPermission.toJson(): ${myPermission?.toJson()}');

      return true;
    }

    return false;
  }

  Future<void> addPermission() async {
    try {
      if (permissionFormGlobalKey.currentState!.validate()) {
        permissionFormGlobalKey.currentState!.save();

        bool? result = await _permissionProvider.addPermission(
          PermissionModel(
            description: description,
            permissionStart: permissionStart,
            permissionEnd: permissionEnd,
            permissionType: type,
            statu: "pending",
            userID: _authViewModel.userModel.value?.id ?? "",
          ),
        );

        if (result == true) {
          Get.to(() => RequestAcceptPage());
        }
      }
    } catch (error) {
      print('Failed to add permission: $error');
    }
  }
}
