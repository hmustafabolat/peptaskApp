import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:peptask/model/permission_model.dart';
import 'package:peptask/service/permission_service.dart';

class PermissionViewModel extends GetxController {
  final PermissionProvider _permissionProvider = PermissionProvider();
  final PermissionService _permissionService = PermissionService();

  RxList<Map<String, dynamic>> permission = <Map<String, dynamic>>[].obs;

  Future<void> getData() async {
    final result = await _permissionService.getData();
    permission.assign(result as Map<String, dynamic>);
  }

  Future<void> addPermission(
      String description,
      DateTime permissionStart,
      DateTime permissionEnd,
      String permissionType,
      String status,
      String userID) async {
    try {
      await _permissionProvider.addPermission(
        Permission(
          description: description,
          permissionStart: permissionStart,
          permissionEnd: permissionEnd,
          permissionType: permissionType,
          statu: status,
          userID: userID,
        ),
      );
      print('Permission added successfully.');
    } catch (error) {
      print('Failed to add permission: $error');
    }
  }
}
