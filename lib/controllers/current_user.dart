import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser{
  final _auth = FirebaseAuth.instance;
  var loggedInUser = null;

  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser;
          if (user!= null) {
            loggedInUser = user;
          }
    } catch (e) {
      print(e);
    }
  }
}