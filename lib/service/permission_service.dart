import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:peptask/model/permission_model.dart';

class PermissionProvider extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool?> addPermission(PermissionModel permission) async {
    try {
      await _firestore
          .collection('requests')
          .doc(permission.userID)
          .set(permission.toJson());

      return true;
    } catch (e) {
      print('Error: PermissionProvider: addPermission: ${e.toString()}');
      return null;
    }
  }

  Future<PermissionModel?> getAllPermission(String? userId) async {
    try {
      var result = await _firestore.collection('requests').doc(userId).get();

      return PermissionModel.fromJson(result);
    } catch (e) {
      print('Error: PermissionProvider: getAllPermission: ${e.toString()}');
      return null;
    }
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
