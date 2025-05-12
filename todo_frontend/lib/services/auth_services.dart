import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_frontend/models/user_model.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> signUpUser(UserModel user) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    UserModel finalUser = UserModel(
      name: user.name,
      userId: userCredential.user!.uid,
      email: user.email,
      password: user.password,
      FcmToken: user.FcmToken,
    );

    if (userCredential.user != null) {
      await _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(finalUser.tojson());
    } else {
      print("User Already Registered!");
    }
  }

  Future<void> signInUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
