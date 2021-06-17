import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:coco2/screens/settings_page.dart';
import 'package:coco2/models/comp.dart';
import 'package:coco2/constants.dart';


class CompanyCard extends StatelessWidget {
  const CompanyCard({
    Key key, this.id, this.inputComps,
  }) : super(key: key);

  final int id;
  final List<Comp> inputComps;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return SettingsPage();
            }
            ));
          },
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height:145,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border:Border.all(width: 2.0, color: Colors.green) ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: (CrossAxisAlignment.start),
                          children: [
                            Text(inputComps[id].title,
                                style: TextStyle(fontSize:22,fontWeight: FontWeight.bold)
                            ),
                            //TODO: Add custom font support
                            SizedBox(height:5),
                            Text(inputComps[id].category,style: TextStyle(fontSize:14,fontWeight: FontWeight.bold)),
                            SizedBox(height:20),
                            Row(
                                children: [
                                  Image.asset(kGOTS, height:30),
                                  Image.asset(kR100, height:30)
                                  //TODO: Add in certification images (not imageA)
                                ]),
                            //TODO: Replace the above with a function to feed image locations to the image asset call
                            SizedBox(height:11),
                            Text("See all certifications >")
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(3.0),
                                      topRight: Radius.circular(17.0),
                                      bottomRight: Radius.circular(3.0),
                                      bottomLeft: Radius.circular(17.0),),
                                    border:Border(
                                      top: BorderSide(width:1.0, color: Colors.green),
                                      bottom:BorderSide(width:1.0, color: Colors.green),
                                      left: BorderSide(width: 1.0, color: Colors.green),
                                        right: BorderSide(width: 1.0, color: Colors.green)),),
                                child: Text(inputComps[id].cocoScore,style: TextStyle(fontSize:14,fontWeight: FontWeight.bold)),
                                height: 30,
                                width:80,
                                alignment: Alignment.center,
                              ),
                            ],),
                          SizedBox(height:3),
                          Row(
                            children: [
                              Image.asset('assets/images/'+inputComps[id].imageA + '.png',height:103),
                              SizedBox(width:5),
                              Image.asset('assets/images/'+inputComps[id].imageB + '.png',height:103),
                              SizedBox(width:10),
                            ],
                          ),],
                      ),
                    ],
                  ),
                ),
              )
          ),
        ),
      ],
    );
  }
}