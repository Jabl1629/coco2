import 'package:flutter/material.dart';
import 'package:coco2/screens/top_app_bar.dart';
import 'package:coco2/screens/nav_bar.dart';
import 'package:coco2/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e){
      print(e);
    }


  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(leftIcon: kBackIcon, title: "Coco Home", rightIcon: kSearchIcon),
      bottomNavigationBar: NavBar(startIndex: 0),
      body: Center(
        child: Text("Welcome to Coco")
        ),
      );
  }
}