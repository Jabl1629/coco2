import 'package:flutter/material.dart' ;
import 'package:coco2/controllers/comp_requester.dart';
import 'package:coco2/models/company_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CompBuilder extends StatelessWidget {
  const CompBuilder({
    Key key,
    @required this.compReq,
  }) : super(key: key);

  final CompRequester compReq;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: compReq.getComps(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.data == null){
          return Container(
            child: Center(
                child: SpinKitChasingDots(
                  color: Colors.green,
                  size: 70.0
                )
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int id) {
              return CompanyCard(id: id, snapshot: snapshot);
            },
          );
        }
      },
    );
  }
}