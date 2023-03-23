import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:peptask/model/permission_model.dart';

class PermissionProvider extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPermission(Permission permission) async {
    try {
      await _firestore.collection('requests').add({
        'description': permission.description,
        'permissionStart': Timestamp.fromDate(permission.permissionStart),
        'permissionEnd': Timestamp.fromDate(permission.permissionEnd),
        'permissionType': permission.permissionType,
        'status': permission.statu,
        'userID': permission.userID,
      });
      print('Data added successfully.');
    } catch (error) {
      print('Failed to add data: $error');
    }
  }
}
