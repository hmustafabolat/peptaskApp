import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:peptask/model/permission_model.dart';

class PermissionProvider extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPermission(Permission permission) async {
    await _firestore.collection('requests').add({
      'description': permission.description,
      'permissionStart': Timestamp.fromDate(permission.permissionStart),
      'permissionEnd': Timestamp.fromDate(permission.permissionEnd),
      'permissionType': permission.permissionType,
      'status': permission.statu,
      'userID': permission.userID,
    });
  }
}

class PermissionService {
  final CollectionReference _dataCollectionRef =
      FirebaseFirestore.instance.collection("requests");

  Future<List<Map<String, dynamic>>> getData() async {
    final data = await _dataCollectionRef.get();
    return data.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
