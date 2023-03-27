import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peptask/model/permission_model.dart';

class PermissionProvider extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool?> addPermission(PermissionModel permission) async {
    try {
      await _firestore
          .collection('requests')
          .doc() //user id
          .set(permission.toJson());

      return true;
    } catch (e) {
      print('Error: PermissionProvider: addPermission: ${e.toString()}');
      return null;
    }
  }

  Future<List<PermissionModel>> getAllPermission(String? userId) async {
    List<PermissionModel> tempList = [];
    await _firestore
        .collection(
            "requests") // where ekleyip user id field i ile kullanıcının id si eşit kontrolü yap
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        tempList.add(PermissionModel(
            description: doc["description"],
            //     permissionStart: doc["permissionStart"],
            //   permissionEnd: doc["permissionEnd"],
            permissionStart: null,
            permissionEnd: null,
            permissionType: doc["permissionType"],
            statu: doc["statu"],
            userID: doc["userID"]));

        log(tempList.last.description.toString());
      });
    });

    //   log("gel all permission başlangıcı");
    //   try {
    //     var result = await _firestore.collection('requests').doc(userId).get();

    //     return PermissionModel.fromJson(result);
    //   } catch (e) {
    //     print('Error: PermissionProvider: getAllPermission: ${e.toString()}');
    //     return null;
    //   }
    // }
    return tempList;
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
