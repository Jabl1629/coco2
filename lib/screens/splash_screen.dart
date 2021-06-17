import 'package:coco2/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' ;
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'splash_screen';
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen>  {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.pushNamed(context, "0"));


    var assetsImage = new AssetImage(
        kCocoIcon); //<- Creates an object that fetches an image.
    var image = new Image(
        image: assetsImage,
        height:300); //<- Creates a widget that displays an image.

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Putting together your top fits",
                  textAlign: TextAlign.center,
                  style:GoogleFonts.montserrat(
                      textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black87,fontStyle: FontStyle.italic))),
              SizedBox(height:20),
              SpinKitCubeGrid(color:Colors.green,size: 100)
            ],
          ),
        )
      );
  }
}