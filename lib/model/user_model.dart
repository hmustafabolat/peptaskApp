import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document)
      : this.id = document.data()?['id'],
        this.name = document.data()?['name'],
        this.email = document.data()?['email'];

  Map<String, dynamic> toJson() {
    return {
      if (this.id != null) 'id': this.id,
      if (this.name != null) 'name': this.name,
      if (this.email != null) 'email': this.email,
      if (this.password != null) 'password': this.password,
    };
  }
}
