import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:coco2/screens/top_app_bar.dart';
import 'package:coco2/screens/nav_bar.dart';
import 'package:coco2/constants.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(leftIcon: kBackIcon, title: "Search Page", rightIcon: kSearchIcon),
      bottomNavigationBar: NavBar(startIndex: 2),
      body: Container(
          padding: EdgeInsets.all(23.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade300,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0)),
                  borderSide: BorderSide.none
                ),
              icon: Icon(
                Icons.search,
                color: Colors.green
              ),
            ),
            onChanged: (searchVal)=> print(searchVal),
            //TODO: Update this to actually search a database (NEED AN ON COMPLETE FUNCTION WHICH PUSHES A RESULTS OR COMPANY SCREEN (ALL TBD - VIDEO 154 - CHECK IF NULL)
            //TODO: Live Search functionality
          )
      ),
    );
  }
}