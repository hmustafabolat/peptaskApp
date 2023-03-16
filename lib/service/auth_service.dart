import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Login Function
  Future<UserModel?> signIn(UserModel userModel) async {
    try {
      ///email null geliyor bu sebeple bu fonksiyon çalışmıyor
      debugPrint("email = ${userModel.email}");
      debugPrint("password = ${userModel.password}");
      var user = await _auth.signInWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
      debugPrint("user = ${user.user.toString()}");

      if (user.user?.uid != null) {
        var doc =
            await _firestore.collection('Person').doc(user.user!.uid).get();

        return UserModel.fromJson(doc);
      } else {
        return UserModel();
      }
    } catch (e) {
      print('Error: AuthService: signIn: ${e.toString()}');
    }
  }

//LogOut Function
  Future<UserModel> signOut() async {
    await _auth.signOut();
    return UserModel();
  }

  currentUser() async {
    var user = _auth.currentUser;

    return await getUserFromFirestore(user?.uid);
  }

  getUserFromFirestore(String? userId) async {
    try {
      if (userId != null) {
        var doc = await _firestore.collection('Person').doc(userId).get();

        return UserModel.fromJson(doc);
      } else {
        return UserModel();
      }
    } catch (e) {
      print('Error: AuthService: signIn: ${e.toString()}');
      return UserModel();
    }
  }

//Register Function
  Future<UserModel?> signUp(UserModel userModel) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);

      userModel.id = user.user?.uid;
      await _firestore
          .collection("Person")
          .doc(user.user?.uid)
          .set(userModel.toJson());

      if (user.user?.uid != null) {
        return userModel;
      } else {
        return UserModel();
      }
    } catch (e) {
      print('Error: AuthService: createPerson: ${e.toString()}');
    }
  }
}
