import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Permission {
  String description;
  DateTime permissionStart;
  DateTime permissionEnd;
  String permissionType;
  String statu;
  String userID;

  Permission({
    required this.description,
    required this.permissionStart,
    required this.permissionEnd,
    required this.permissionType,
    required this.statu,
    required this.userID,
  });
}
