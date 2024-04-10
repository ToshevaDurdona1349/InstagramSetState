import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngdemo17/services/prefs_service.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
//sayn in
  static Future<User?> signInUser(
      BuildContext context, String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      print(user.toString());
      return user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
//sayn up
  static Future<User?> signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = authResult.user;
      print(user.toString());
      return user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static void signOutUser(BuildContext context)async {
    _auth.signOut();
    await Prefs.removeUserId();
  }
}