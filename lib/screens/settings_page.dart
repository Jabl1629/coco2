import 'package:flutter/material.dart';
import 'package:coco2/screens/top_app_bar.dart';
import 'package:coco2/screens/nav_bar.dart';
import 'package:coco2/constants.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(leftIcon: kBackIcon, title: "Settings", rightIcon: kSearchIcon),
      bottomNavigationBar: NavBar(startIndex: 3),
      body: Center(
          child: Text("Change your settings")
      ),
    );
  }
}