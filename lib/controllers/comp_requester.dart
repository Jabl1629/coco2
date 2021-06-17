import 'dart:async';

import 'package:coco2/models/company_card.dart';
import 'package:flutter/material.dart';
import 'package:coco2/models/comp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CompRequester extends StatelessWidget {
  final String category;

  CompRequester(this.category);

  @override

  Widget build(BuildContext context) {
    CollectionReference companies = FirebaseFirestore.instance.collection('companies');

    Future returnFuture() {
      if (category == "N/A"){
        return companies.get();
      }
      else {
        return companies.where('category', isEqualTo: category).get();
      }
    }


    return FutureBuilder<QuerySnapshot>(
      future: returnFuture(),

      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<DocumentSnapshot> docs = snapshot.data.docs;
          print(docs);
          var length = docs.length;
          List<Comp> comps = [];
          var list = [for(var i=0; i<length; i+=1) i];
          for (var id in list){
            Map<dynamic,dynamic> data = docs[id].data();
            Comp comp = Comp(
              id: id,
              title: data['title'],
              imageA: data['imageA'],
              imageB: data['imageB'],
              gender: data['gender'],
              category: data['category'],
              description: data['description'],
              cocoScore: data['cocoScore'].toString()
            );
            comps.add(comp);
            print(comp.title);
          }


            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 1);
              },
              itemCount: comps.length,
               itemBuilder: (BuildContext context, int id) {
                 return CompanyCard(id: id, inputComps: comps);
               },
           );
        }

        return SpinKitCubeGrid(color:Colors.green,size: 100);
      },
    );
  }
}