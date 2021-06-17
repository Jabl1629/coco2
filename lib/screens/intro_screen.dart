import 'package:flutter/material.dart';
import 'package:coco2/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coco2/screens/pref_screen.dart';

class IntroScreen extends StatefulWidget {
  static const id = 'intro_screen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool _visible = false;

  @override

  void initState() {
    super.initState();
    fadeInText();
  }

  void fadeInText(){
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        _visible = !_visible;
      });
    },);
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:40),
              Container(
                height: 60,
                child: Image.asset(kCocoIcon)
              ),
              SizedBox(height:40),
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                    width:260,
                    child: Text("Coco makes it easy to find products that align with the causes YOU care about most",
                      textAlign: TextAlign.center,
                        style:GoogleFonts.montserrat(
                        textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black87,fontStyle: FontStyle.italic))),
              ),
              ),
              SizedBox(height:30),
              AnimatedOpacity(opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child:Center(
                  child: Container(height: 170,
                    child: Image.asset(kMap),
                  ),
                ),
              ),
              SizedBox(height: 50),
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  width:260,
                  child:  Material(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PrefScreen.id);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Record Your Preferences',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ]
      ),
        ),
      ),
    );
  }
}
