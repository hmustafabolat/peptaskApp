import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? username;
  String? email;
  String? password;
  String? passwordVerify;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.password,
    this.passwordVerify,
  });

  UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document)
      : this.id = document.data()?['id'],
        this.username = document.data()?['username'],
        this.email = document.data()?['email'];

  Map<String, dynamic> toJson() {
    return {
      if (this.id != null) 'id': this.id,
      if (this.username != null) 'username': this.username,
      if (this.email != null) 'email': this.email,
      if (this.password != null) 'password': this.password,
    };
  }
}