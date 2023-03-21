// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PermissionModel {
  String? description;
  DateTime? permissionStart;
  DateTime? permissionEnd;
  String? statu;
  String? permissionType;
  String? userID;

  PermissionModel({
    this.description,
    this.permissionStart,
    this.permissionEnd,
    this.statu,
    this.permissionType,
    this.userID,
  });

  PermissionModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document)
      : this.description = document.data()?["description"],
        this.permissionStart = document.data()?["permissionStart"],
        this.permissionEnd = document.data()?["permissionEnd"],
        this.statu = document.data()?["statu"],
        this.permissionType = document.data()?["permissionType"],
        this.userID = document.data()?["userID"];

  Map<String, dynamic> toJson() {
    return {
      if (this.description != null) "description": this.description,
      if (this.permissionStart != null) "permissionStart": this.permissionStart,
      if (this.permissionEnd != null) "permissionEnd": this.permissionEnd,
      if (this.statu != null) "statu": this.statu,
      if (this.permissionType != null) "permissionType": this.permissionType,
      if (this.userID != null) "userID": this.userID
    };
  }
}
