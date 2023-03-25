import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PermissionModel {
  String? description;
  DateTime? permissionStart;
  DateTime? permissionEnd;
  String? permissionType;
  String? statu;
  String? userID;

  PermissionModel({
    required this.description,
    required this.permissionStart,
    required this.permissionEnd,
    required this.permissionType,
    required this.statu,
    required this.userID,
  });

  PermissionModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document)
      : description = document.data()?['description'],
        permissionStart = document.data()?['permissionStart'].toDate(),
        permissionEnd = document.data()?['permissionEnd'].toDate(),
        permissionType = document.data()?['permissionType'],
        statu = document.data()?['statu'],
        userID = document.data()?["userID"];

  Map<String, dynamic> toJson() {
    return {
      if (description != null) 'description': description,
      if (permissionStart != null) 'permissionStart': permissionStart,
      if (permissionEnd != null) 'permissionEnd': permissionEnd,
      if (permissionType != null) 'permissionType': permissionType,
      if (statu != null) "statu": statu,
      if (userID != null) "userID": userID,
    };
  }
}
