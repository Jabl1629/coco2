import 'package:coco2/controllers/comp_requester.dart';
import 'package:coco2/controllers/comp_builder.dart';
import 'package:flutter/material.dart' ;
import 'package:coco2/constants.dart';
import 'package:coco2/screens/top_app_bar.dart';
import 'package:coco2/screens/nav_bar.dart';

class TopFits extends StatefulWidget {
  @override
  _TopFitsState createState() => _TopFitsState();
}
class _TopFitsState extends State<TopFits> {
  var compReq = CompRequester();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(leftIcon: kBackIcon, title: "Top Fits", rightIcon: kSearchIcon),
      bottomNavigationBar: NavBar(startIndex:1),
      body: Container(
        child: CompBuilder(compReq: compReq),
      ),
    );
  }
}













