import 'package:flutter/material.dart';
import 'package:coco2/screens/top_app_bar.dart';
import 'package:coco2/screens/nav_bar.dart';
import 'package:coco2/constants.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home_screen';

  @override
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