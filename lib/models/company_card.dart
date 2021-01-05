import 'package:flutter/material.dart';
import 'package:coco2/screens/settings_page.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    Key key, this.id, this.snapshot,
  }) : super(key: key);

  final int id;
  final AsyncSnapshot snapshot;

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
                            Text(snapshot.data[id].title,
                                style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)
                            ),
                            //TODO: Add custom font support
                            SizedBox(height:7),
                            Text(snapshot.data[id].category,style: TextStyle(fontSize:12,fontWeight: FontWeight.bold)),
                            SizedBox(height:7),
                            Row(
                                children: [
                                  Image.network(snapshot.data[id].imageA,height:45,width:45)
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
                                      topRight: Radius.circular(18.0),
                                      bottomRight: Radius.circular(3.0),
                                      bottomLeft: Radius.circular(18.0),),
                                    border:Border.all(width: 2.0, color: Colors.green) ),
                                child: Text(
                                    "99"
                                ),
                                height: 30,
                                width:80,
                                alignment: Alignment.center,
                              ),
                            ],),
                          SizedBox(height:11),
                          Row(
                            children: [
                              Image.network(snapshot.data[id].imageA,height:75,width:75),
                              SizedBox(width:5),
                              Image.network(snapshot.data[id].imageB,height:75,width:75),
                              SizedBox(width:10)
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