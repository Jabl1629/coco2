import 'package:coco2/controllers/comp_requester.dart';
import 'package:flutter/material.dart' ;
import 'package:coco2/constants.dart';
import 'package:coco2/screens/top_app_bar.dart';
import 'package:coco2/screens/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';


class TopFits extends StatefulWidget {
  @override
  _TopFitsState createState() => _TopFitsState();

}
class _TopFitsState extends State<TopFits> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      User user = _auth.currentUser;
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
      appBar: TopAppBar(leftIcon: kBackIcon, title: "Top Fits", rightIcon: kSearchIcon),
      bottomNavigationBar: NavBar(startIndex:0),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              SizedBox(height:15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Text("Welcome to Coco here are your top fits:" ,
                    textAlign: TextAlign.left,
                    style:GoogleFonts.montserrat(
                        textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black87,fontStyle: FontStyle.italic))),
              ),
              SizedBox(height:10),
              Expanded(child: CompRequester("N/A")),
            ],
          ),
        ),
      ),
    );
  }
}













