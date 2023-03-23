import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  signUp(UserModel userModel) async {
    try {
      await _firestore
          .collection("Person")
          .doc(userModel.id)
          .set(userModel.toJson());

      return userModel;
    } catch (e) {
      print('Error: FirestoreService: signUp: ${e.toString()}');
      return null;
    }
  }

  signIn(String? uid) async {
    try {
      var user = await _firestore.collection("Person").doc(uid).get();

      return UserModel.fromJson(user);
    } catch (e) {
      print('Error: FirestoreService: signIn: ${e.toString()}');
      return null;
    }
  }
}
